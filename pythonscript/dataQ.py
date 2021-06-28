#for multiple
import os
import time
import datetime
import shutil
import keyboard
import plotter
import os.path
import sys

#for temp sensor
import glob
 
#for voltmeter
import busio
import digitalio
import board
import adafruit_mcp3xxx.mcp3008 as MCP
from adafruit_mcp3xxx.analog_in import AnalogIn

#for serial data
import serial


#################################################################

#temperature probe

def temp_init():
    device_file = ''
    os.system('modprobe w1-gpio')
    os.system('modprobe w1-therm')
    
    base_dir = '/sys/bus/w1/devices/'
    folder_object = glob.glob(base_dir + '28*')
    if(len(folder_object)):
        device_folder = folder_object[0]
    else:
        print('\nERROR: Failed to initialize temperature sensor, try reconnecting the sensor or set read_temp = False\n')
        sys.exit(1)
    device_file = device_folder + '/w1_slave'
    return device_file

#reads thermocouple raw data
def read_temp_raw(temp_device_file):
    f = open(temp_device_file, 'r')
    lines = f.readlines()
    
    f.close()
    
    return lines
 
#calls read_temp_raw, converts data into C and F
def read_temp(temp_device_file):
    lines = read_temp_raw(temp_device_file)
    
    
    #setting default values for error if no temp able to be measured
    temp_c = 'empty'
    temp_f = 'empty'
    
    #sometime read_temp_raw is empty list, this deals with that
    while len(lines) < 1:
        time.sleep(0.2)
        lines = read_temp_raw(temp_device_file)
        
    #finding temps in raw data then converting to C and F and returning
    equals_pos = lines[1].find('t=')
    if equals_pos != -1:
        temp_string = lines[1][equals_pos+2:]
        temp_c = float(temp_string) / 1000.0
        
        #calculating negative temperatures
        #operating temp of temp sensor -50 to 125 C
        if temp_c > 200:
            temp_c = temp_c - 4096
            
        temp_f = temp_c * 9.0 / 5.0 + 32.0
        
        #print(temp_c)
    
    return temp_c, temp_f
            
#################################################################

#voltmeter
    
def volt_init():
    # create the spi bus
    spi = busio.SPI(clock=board.SCK, MISO=board.MISO, MOSI=board.MOSI)

    # create the cs (chip select)
    cs = digitalio.DigitalInOut(board.D22)

    # create the mcp object
    mcp = MCP.MCP3008(spi, cs)

    # create an analog input channel on pin 0 and 1
    chan0 = AnalogIn(mcp, MCP.P0)
    chan1 = AnalogIn(mcp, MCP.P1)
    chan2 = AnalogIn(mcp, MCP.P2)
    chan3 = AnalogIn(mcp, MCP.P3)
    chan4 = AnalogIn(mcp, MCP.P4)
    chan5 = AnalogIn(mcp, MCP.P5)
    chan6 = AnalogIn(mcp, MCP.P6)
    chan7 = AnalogIn(mcp, MCP.P7)
    
    return [chan0, chan1, chan2, chan3, chan4, chan5, chan6, chan7]

#converts adc value to relevant voltage
def convert_volt(adcvalue, v_ref, r_divide):
    
    ratio = adcvalue / 65535
    
    return ratio * r_divide * v_ref

#takes in raw adc values and returns the most common one
def adc_acquire(channel_list, chan):
    #taking in raw adc values
    adc_list =[]
    window = []
    
    sample_size = 20
    cut_off_window = 5
    
    for i in range(0,sample_size):
        adc_list.append(channel_list[chan].value)
    
    #windowing
    adc_asc = sorted(adc_list)
    
    for i in range(cut_off_window,sample_size-cut_off_window):
        window.append(adc_asc[i])
    
    window_av = sum(window) / len(window)
    
    return window_av
    

#calculates individual cell voltages
def cell_subtraction(volt_list, adc_config):
    sub_list = ['','','','','','','','']
    last_v = 0
    
    #calculating individual cell voltages
    for i in range(0,len(sub_list)):
        #tuple unpack
        (read_bool, v_ref, r_divide) = adc_config[i]
        if read_bool:
            sub_list[i] = volt_list[i] - last_v
            last_v = volt_list[i]
    
    #returns float values
    return sub_list
    
def read_volt(channel_list, v_sub, adc_config):
    #initializing list of voltages to return
    #returns empty string if no values taken
    volt_list = ['','','','','','','','']
    
    for i in range(0,len(volt_list)):
        #tuple unpack
        (read_bool, v_ref, r_divide) = adc_config[i]
        #takes voltage reading and edits return list
        if read_bool:
            #gets raw adc value
            adc_val = adc_acquire(channel_list, i)
            #converts adc value to voltage
            volt_list[i] = convert_volt(adc_val, v_ref, r_divide)
            
    '''
    #UNCOMMENT THESE LINES TO PRINT VOLTAGES REAL TIME
    print('adc0- ' + str(volt_list[0]))
    print('adc1- ' + str(volt_list[1]))
    print('adc2- ' + str(volt_list[2]))
    print('adc3- ' + str(volt_list[3]))
    print('adc4- ' + str(volt_list[4]))
    print('adc5- ' + str(volt_list[5]))
    print('adc6- ' + str(volt_list[6]))
    print('adc7- ' + str(volt_list[7]))
    print('')
    '''

    #function for calculating indivual cell voltages using subtraction
    if v_sub:
        return cell_subtraction(volt_list, adc_config)
    else:
        #returns voltage measurement floats
        return volt_list

#################################################################

#serial

def serial_init(path_serial, baud_rate):
    serial.Serial(path_serial, baud_rate)
    


def read_serial(path_serial):
    #reading serial raw output
    with open(path_serial, encoding="utf8", errors='ignore') as f:
        #must call readline twice bc of print statement
        junk = f.readline()
        contents = f.readline()
    
    #is it a number or junk?
    capacity_num = ''
    for char in contents:
        if char in ['1','2','3','4','5','6','7','8','9','0',',','#']:
            capacity_num = capacity_num + str(char)
         
    #returns empty string if no capacity at the moment     
    return capacity_num
    
#end of serial
    
###############################################
#file set up
def file_init(path_write):
    #folder for graph images and old data logs
    folder = 'LoggedData{}'.format(datetime.datetime.now().strftime("%Y-%m-%d %H,%M,%S"))
    folder_path = os.path.join(path_write,folder)
    try:
        os.mkdir(folder_path)
    except:
        print('failed to make directory -->' + folder_path)
        sys.exit(1)
        
    #making current data log csv file
    file_name = 'currentloggeddata.csv'
    curr_log_name = os.path.join(path_write, file_name)
    #creating column headers in CSV file
    file = open(curr_log_name, 'w')
    string_to_write = 'Time,Temp C,Temp F,ADC 0,ADC 1,ADC 2,ADC 3,ADC 4,ADC 5,ADC 6,ADC 7,Cycle Num,Capacity\n'
    file.write(string_to_write)
    file.close()
    
    return curr_log_name, folder_path

#saving files and figures
def file_closeout(folder_path, curr_log_name, capacities_list, read_temp_bool, read_volt_bool, read_serial_bool,adc_config):
    print('Saving data log file....')
    
    #saving copy of loggeddata csv
    csv_dir = 'loggeddata{}.csv'.format(datetime.datetime.now().strftime("%Y-%m-%d %H,%M,%S"))
    target = os.path.join(folder_path, csv_dir)
    shutil.copyfile(curr_log_name, target)
    
    #plot data and save images of it
    plotter.plot_and_save(folder_path, curr_log_name, read_temp_bool, read_volt_bool, read_serial_bool,adc_config)
    
    
    #saving list of capacities
    file_name = 'capacities-list.txt'
    cap_log_name = os.path.join(folder_path, file_name)
    c_file = open(cap_log_name, 'w')
    string_to_write = str(capacities_list)
    c_file.write(string_to_write)
    c_file.close()
    
    print('datalog program complete, files saved')
    
#function finds the min sample rate and makes this the writing rate
def write_rate(sampling_dict):
    read_temp_bool, sample_rate_temp = sampling_dict['temp']
    read_volt_bool, sample_rate_volt = sampling_dict['volt']
    read_serial_bool, sample_rate_serial = sampling_dict['serial']
    
    rate_list = []
    
    #only considers sample rate if taking that type of measurement
    if read_temp_bool:
        rate_list.append(sample_rate_temp)
    if read_volt_bool:
        rate_list.append(sample_rate_volt)
    if read_serial_bool:
        rate_list.append(sample_rate_serial)
    #error handling in case all sampling bools are set to False
    try:    
        return min(rate_list)
    except:
        return 5

#function to take and record data
def data_loop(sampling_dict, temp_device_file, channel_list, v_sub, adc_config, path_serial, curr_log_name):
    #Sampling configuration
    read_temp_bool, sample_rate_temp = sampling_dict['temp']
    read_volt_bool, sample_rate_volt = sampling_dict['volt']
    read_serial_bool, sample_rate_serial = sampling_dict['serial']
    
    #initializing times for sampling rates
    temp_time = 0
    volt_time = 0
    serial_time = 0
    print_time = 0
    write_time = 0
    
    #initializing sample values that are written to CSV
    s_celsius = ''
    s_fahrenheit = ''
    s_cell_list = ['','','','','','','','']
    s_capacity = ''
    
    #list of data values
    temp_list_f = []
    temp_list_c = []
    adc_list = [[],[],[],[],[],[],[],[]]
    capacities_list = []
    
    #getting right length for writing sampling rate
    rate_write_csv = write_rate(sampling_dict)
    
    print('data logging start')
    print("Press 'alt+s' to end data logging and save graphs")
    
    #taking and recording the data loop
    #creating hotkey for exiting out of loop
    while not (keyboard.is_pressed("s") and keyboard.is_pressed("alt")):
            
        #taking time for comparison of time differences for read calls
        t0 = time.perf_counter()
        #current real world time for file names
        time_now = datetime.datetime.now().replace(microsecond=0)
        #temp measurement
        if t0 - temp_time >= sample_rate_temp and read_temp_bool:
            temp_time = t0
            (celsius, fahrenheit) = read_temp(temp_device_file)
            if (celsius == 'empty' or fahrenheit == 'empty'):
                print('Failed to read_temp()')
                break
            
            s_celsius = round(celsius,2)
            s_fahrenheit = round(fahrenheit,2)
            #appending to list
            temp_list_c.append(s_celsius)
            temp_list_f.append(s_fahrenheit)
        
        #voltage measurement
        if t0 - volt_time >= sample_rate_volt and read_volt_bool:
            volt_time = t0
            
            #reads voltages
            volt_list = read_volt(channel_list, v_sub, adc_config)
        
            #adding to lists
            for i in range(0,8):
                #tuple unpack
                (read_bool, v_ref, r_divide) = adc_config[i]
                #only adds to list if a reading was taken
                if read_bool:
                    #rounding measurments for CSV
                    round_volt = round(volt_list[i], 3)
                    s_cell_list[i] = round_volt
                    
                    #appending to list
                    adc_list[i].append(s_cell_list[i])
            
        #serial read
        if t0 - serial_time >= sample_rate_serial and read_serial_bool:
            serial_time = t0
            s_capacity = read_serial(path_serial)
            if s_capacity != '':
                capacities_list.append(s_capacity)
                
        #writing to file
        #checking for sampling time 
        if t0 - write_time >= rate_write_csv:
            write_time = t0
            
            file = open(curr_log_name, 'a')
            string_to_write = '{},{},{},{},{},{},{},{},{},{},{},{}\n' \
                .format(str(time_now), s_celsius, s_fahrenheit, s_cell_list[0], s_cell_list[1], s_cell_list[2], s_cell_list[3], s_cell_list[4], s_cell_list[5], s_cell_list[6], s_cell_list[7], s_capacity)
            file.write(string_to_write)
            file.close()
            #resetting values
            s_celsius = ''
            s_fahrenheit = ''
            s_cell_list = ['','','','','','','','']
            s_capacity = ''
        
    print('')
    print('alt and s were pressed, initiating termination sequence.....')
    
    return temp_list_f, temp_list_c, adc_list, capacities_list

def record_data(config_tuple):
    #setting default values for loop args in case not initialized
    temp_device_file = ''
    channel_list = []
    path_serial = ''
    
    #unpacking tuple
    sampling_dict, path_serial, baud_rate, v_sub, adc_config, path_to_save = config_tuple
    #Sampling configuration tuple unpacking
    read_temp_bool, sample_rate_temp = sampling_dict['temp']
    read_volt_bool, sample_rate_volt = sampling_dict['volt']
    read_serial_bool, sample_rate_serial = sampling_dict['serial']
    #temperature
    if read_temp_bool:
        temp_device_file = temp_init()
    #volt init
    if read_volt_bool:
        channel_list = volt_init()
    
    #serial data
    if read_serial_bool:
        serial_init(path_serial, baud_rate)
    
    #writing to file set up
    curr_log_name, folder_path = file_init(path_to_save)
    
    
    ###########################################
    #data collection loop
    try:
        temp_list_f, temp_list_c, adc_list, capacities_list =\
                 data_loop(sampling_dict, temp_device_file, channel_list, v_sub, adc_config, path_serial, curr_log_name)
    except:
        print('an error took place')
    finally:
        file_closeout(folder_path, curr_log_name, capacities_list, read_temp_bool, read_volt_bool, read_serial_bool,adc_config)
    
    ###########################################
    
    print('')
    print("if live plot graphs are displaying, Press 'ctrl+c' to end program")

