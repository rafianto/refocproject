import psycopg2
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
import scipy as stat

sns.set()

hostname = 'localhost'
database = 'hr'
username = 'hr'
pwd = 'hr'
port_id = 5432

try:
    conn = psycopg2.connect(
        host = hostname,
        dbname = database,
        user = username,
        password = pwd,
        port = port_id
    )
    
    
    # cur = conn.cursor()
    # cur.execute("select *  from ped_crashes limit 5")
    # row = cur.fetchall() 
    # print("#---------------------------------------")
    # for r in row:
    #    print(f" id {r[0]}  {r[1]}  {r[2]} {r[3]}")
    # print("#---------------------------------------")    
 
    
    data = pd.read_sql('''select * from crash c where c.state_name in ('Texas','Florida','New York')''',conn)
    # dx = data.head(10) -- cek point
    # print(dx)

    # injury crash
    # plt.figure(figsize=(15,10))
    # sns.set_palette("Set3")
    # plt.title("Worst Injury in Crash", fontsize=25)
    # sns.countplot(x="Worst Injury in Crash", data=data)
    # plt.show()
    
    # parametaer
    injury_num = []
    for i in data["light_condition_name"]:
        if i == "Dark - Unknown Lighting":
            injury_num.append(0)
        elif i == "Dusk":
            injury_num.append(1)
        elif i == "Reported as Unknown":
            injury_num.append(2)
        elif i == "Other":
            injury_num.append(3)
        elif i == "Dark - Lighted":
            injury_num.append(4)
        elif i == "Dark - Not Lighted":
            injury_num.append(5)
        elif i == "Dawn":
            injury_num.append(6)
        elif i == "Daylight":
            injury_num.append(7)
        else:
            injury_num.append(8)

    data["Injury"] = injury_num
    
    # person age ============
    # plt.figure(figsize=(15,10))
    # plt.title("Person Age", fontsize=25)
    # sns.histplot(x="Person Age", kde=True, hue="Person Gender", data=data, bins=100)
    # plt.xlim(0,100)
    # plt.ylim(0,150)
    # plt.show()

    # Crash day Gender
    plt.figure(figsize=(15,10))
    plt.title("State Name", fontsize=25)
    sns.histplot(x="state_name", hue="number_of_fatalities", kde=True, bins=31, data=data)
    plt.show()
    
 
    print("conecction to PostgreSQL succes and done")
    
    # cur.close() 
    conn.close()
except Exception as error:
    print(error)