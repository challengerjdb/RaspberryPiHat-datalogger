import pandas as pd
import matplotlib.pyplot as plt
from matplotlib.animation import FuncAnimation
import datetime
import time
import keyboard
import os
import main

#creates the subplots
def plot_init():
    figT, axT = plt.subplots(figsize=(8,4))
    figV, axV = plt.subplots(figsize=(8,4))
    figC, axC = plt.subplots(figsize=(8,4))
    
    plt.rcParams['font.size'] = '11'
    
    return figT, axT, figV, axV, figC, axC

#graphing the fahrenheit measurment subplot
def graph_temp_F(x,y_TempF,ax_T,fig_T):
    ax_T.cla()
    #interpolating on data that will be line plotted to account for NaN's when have different times between sampling and writing to CSV
    ax_T.plot(x,y_TempF.interpolate(method='linear'))
    #setting number of x axis labels
    ax_T.xaxis.set_major_locator(plt.MaxNLocator(5))
    ax_T.set_ylim([0,100])
    ax_T.set_title('Temperature')
    ax_T.set_ylabel('Fahrenheit',fontsize = 12)
    fig_T.autofmt_xdate()
    fig_T.tight_layout()
    
#graphing the fahrenheit measurment subplot
def graph_temp_C(x,y_TempC,ax_T,fig_T):
    ax_T.cla()
    #interpolating on data that will be line plotted to account for NaN's when have different times between sampling and writing to CSV
    ax_T.plot(x,y_TempC.interpolate(method='linear'))
    #setting number of x axis labels
    ax_T.xaxis.set_major_locator(plt.MaxNLocator(5))
    #ax_T.set_ylim([-50,100])
    ax_T.set_title('Temperature')
    ax_T.set_ylabel('Celsius',fontsize = 12)
    fig_T.autofmt_xdate()
    fig_T.tight_layout()

#graphing all 4 voltages on a subplot
def graph_volt(x,y_Volt,ax_V,fig_V,adc_config):
    ax_V.cla()
    #interpolating on data that will be line plotted to account for NaN's when have different times between sampling and writing to CSV
    for i in range(0,8):
        (read_bool, v_ref, r_divide) = adc_config[i]
        if read_bool:
            ax_V.plot(x, y_Volt[i].interpolate(method='linear'), label= f'ADC {i}', linewidth = 2)
    
    #setting number of x axis labels
    ax_V.xaxis.set_major_locator(plt.MaxNLocator(5))
    #ax_V.set_ylim([3.05,3.25])
    ax_V.set_title('Cell Voltages')
    ax_V.set_ylabel('Volts',fontsize = 12)
    ax_V.legend(loc='upper left')
    fig_V.autofmt_xdate()
    fig_V.tight_layout()
    
#creates a capacity scatter subplot
def graph_capacity(x,y_Cap,ax_C,fig_C):
    ax_C.cla()
    ax_C.scatter(x, y_Cap)
    ax_C.xaxis.set_major_locator(plt.MaxNLocator(5))
    ax_C.set_ylim([0,50000])
    ax_C.set_title('Capacity')
    ax_C.set_ylabel('capacity time meas',fontsize = 12)
    fig_C.autofmt_xdate()
    fig_C.tight_layout()

def csv_reader(curr_log_name):
    #reading CSV
    #assigning data types so can read more quickly
    
    dtypes = {"Time": "object",
              'Temp C': "float64",
              "Temp F": "float64",
              "ADC 0": "float64",
              "ADC 1": "float64",
              "ADC 2": "float64",
              "ADC 3": "float64",
              "ADC 4": "float64",
              "ADC 5": "float64",
              "ADC 6": "float64",
              "ADC 7": "float64",
              "Cycle Num": "object",
              "Capacity": "float64"}
    #reading file, header=0 tells it that first row is column titles
    data = pd.read_csv(curr_log_name, header=0, dtype=dtypes)
    
    x = data['Time']
    y_TempC = data['Temp C']
    y_TempF = data['Temp F']
    y_Volt = [data['ADC 0'],data['ADC 1'],data['ADC 2'],data['ADC 3'],data['ADC 4'],data['ADC 5'],data['ADC 6'],data['ADC 7']]
    y_Cap = data['Capacity']
    
    return x, y_TempC, y_TempF, y_Volt, y_Cap

    

#function plots and saves data, for use by dataQ once completed running
def plot_and_save(folder_path, curr_log_name, read_temp_bool, read_volt_bool, read_serial_bool, adc_config):
    #setting style
    plt.style.use('fivethirtyeight')
    #creating subplots
    fig_T, ax_T, fig_V, ax_V, fig_C, ax_C = plot_init()
    
    #reading CSV
    x, y_TempC, y_TempF, y_Volt, y_Cap = csv_reader(curr_log_name)
    
    #graph and save graph images as file
    if read_temp_bool:
        graph_temp_F(x,y_TempF,ax_T,fig_T)
        fig_T_file = os.path.join(folder_path,'tempgraph.png')
        fig_T.savefig(fig_T_file)
    if read_volt_bool:
        graph_volt(x,y_Volt,ax_V,fig_V,adc_config)
        fig_V_file = os.path.join(folder_path,'voltgraph.png')
        fig_V.savefig(fig_V_file)
    if read_serial_bool:
        graph_capacity(x,y_Cap,ax_C,fig_C)
        fig_C_file = os.path.join(folder_path,'capacitygraph.png')
        fig_C.savefig(fig_C_file)
    
#helper function of live_plotter does actual graphing
def animate(i,graph_args):
    fig_T,ax_T,fig_V,ax_V,fig_C,ax_C = graph_args
    
    #annoying file name stuff to deal with running live plotter separately
    #retrieves file path from main file so then plotter can access it
    a,b,c,d, adc_config, path_to_save = main.main_init()
    file_name = 'currentloggeddata.csv'
    curr_log_name = os.path.join(path_to_save, file_name)
    
    #reading CSV
    x, y_TempC, y_TempF, y_Volt, y_Cap = csv_reader(curr_log_name)
    
    #graph
    #graph_temp_F(x,y_TempF,ax_T,fig_T)
    graph_temp_C(x,y_TempC,ax_T,fig_T)
    graph_volt(x,y_Volt,ax_V,fig_V,adc_config)
    graph_capacity(x,y_Cap,ax_C,fig_C)
    
#real time plotting of data as sampled
def live_plotter():
    plt.style.use('fivethirtyeight')
    
    #creating figures and axes to graph
    fig_T, ax_T, fig_V, ax_V, fig_C, ax_C = plot_init()
    
    #naming the figure windows
    fig_T.canvas.set_window_title('Temperature')
    fig_V.canvas.set_window_title('Voltage')
    fig_C.canvas.set_window_title('Capacity')
    
    #live animating the functions
    ani_T = FuncAnimation(fig_T, animate, fargs=((fig_T,ax_T,fig_V,ax_V,fig_C,ax_C),), interval=10000)
    ani_V = FuncAnimation(fig_V, animate, fargs=((fig_T,ax_T,fig_V,ax_V,fig_C,ax_C),), interval=10000)
    ani_C = FuncAnimation(fig_C, animate, fargs=((fig_T,ax_T,fig_V,ax_V,fig_C,ax_C),), interval=10000)
    
    plt.show()