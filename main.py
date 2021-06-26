import dataQ

#The User may configure Temperature, Voltage, Serial, and Files to their liking

def main_init():
    '''TEMPERATURE'''
    #set to TRUE if want to temperature measurements, FALSE if not
    read_temp = True
    #set to integer that is desired number of seconds between each sample being taken
    sample_rate_temp = 5

    '''VOLTAGE'''
    #set to TRUE if want to voltage measurements, FALSE if not
    read_volt = True
    #set to integer that is desired number of seconds between each sample being taken
    sample_rate_volt = 5
    
    #subtracts differences in voltages
    #when this is true the lowest voltage input should be at the lowest ADC channel you are using
    #the second lowest voltage input should be at the next lowest ADC channel, and so on... 
    v_sub = False
    
    #first term is whether to take readings on that ADC pin
    #second term is voltage reference used by ADC
    #third term is voltage divider coefficient
    
    ADC_0 = (True,5.139,4)
    ADC_1 = (True,5.099,4)
    ADC_2 = (True,5.085,4)
    ADC_3 = (True,5.106,4)
    ADC_4 = (False,5.118,4)
    ADC_5 = (False,5.147,4)
    ADC_6 = (False,5.111,4)
    ADC_7 = (False,5.098,4)
    
    '''SERIAL'''
    #set to TRUE if want to serial measurements, FALSE if not
    read_serial_capacities = True
    #set to integer that is desired number of seconds between each sample being taken
    sample_rate_serial = 15
    #path to serial in of RPi
    path_serial = '/dev/ttyUSB0'
    baud_rate = 9600

    '''FILES'''
    #location to save all files and graphs
    path_to_save =  '/media/pi/32CA-4E753'
    #path_to_save =  '/home/pi/logdata'
    
#do not edit below this
#####################################
    #list of ADC configuration tuples
    adc_config = [ADC_0,ADC_1,ADC_2,ADC_3,ADC_4,ADC_5,ADC_6,ADC_7]
    #dictionary of sampling booleans and rates
    sampling_dict = {'temp':(read_temp, sample_rate_temp),'volt':(read_volt, sample_rate_volt),'serial':(read_serial_capacities, sample_rate_serial)}
    
    return sampling_dict, path_serial, baud_rate, v_sub, adc_config, path_to_save

def run_main():
    #initializing all values
    sampling_dict, path_serial, baud_rate, v_sub, adc_config, path_to_save = main_init()
    
    #tuple to be passed into dataQ
    config_tuple = (sampling_dict, path_serial, baud_rate, v_sub, adc_config, path_to_save)

    #initiating dataQ
    dataQ.record_data(config_tuple)
