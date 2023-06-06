#!/bin/bash

#Create required directories and set permissions
mkdir mobility_files
mkdir -p Output/nam
mkdir -p Output/trace
mkdir -p Output/Results
chmod 777 -R mobility_files

#Create required variables to store the parameter values.
send=0
recv=0
pdr=0
co=0
nro=0
dl=0
tp=0
pdrop=0

#Create required variables to store the average of parameter values.
avg_send=0
avg_recv=0
avg_pdr=0
avg_co=0
avg_nro=0
avg_dl=0
avg_tp=0
avg_pdrop=0
count=10

#Create header of CSV file.
echo ""| awk 'BEGIN{printf "Simulation_Number,No_of_Packets_Sent,No_of_Packets_Received,Packet_Delivery_Ratio,Control_Overhead,Normalized_Routing_Overhead,Delay,Throughput,Packet_Dropping_Ratio"}'>Output/Results/Final_Result.csv

#Main loop which runs 10 times.
for (( i=1; i<=10; i++))
	do
		#Creates 10 mobility files. Each of which is named as mob1, mob2, ... , mob10.
		./setdest -v 2 -n 50 -m 1 -M 5 -t 200 -p 5 -x 500 -y 500 > mobility_files/mob$i		

		#Call TCL script with mobility file as a parameter.
		ns aodv.tcl mobility_files/mob$i

		#Call analysis file and redirect the parameter values to file Result.txt
		printf "########## Simulation number $i ##########\n\n" >> Result.txt		
		awk -f analysis.awk out_$i.tr >> Result.txt
		printf "\n\n" >> Result.txt		

		#Call analysis file and redirect the parameter values to file tmp_result.
		awk -f analysis.awk out_$i.tr > tmp_result

		#Extract the parameter value from the file tmp_result and redirect it to the temporary file 1.txt.
		grep "No_of_Packets_Sent:" tmp_result |  awk 'BEGIN{}{print $2;}' > 1.txt
		send=$(<1.txt)

		#Add all the values to average variable.
		avg_send=$( bc <<< "$send + $avg_send ")

		grep "No_of_Packets_Received:" tmp_result |  awk 'BEGIN{}{print $2;}' > 1.txt
		recv=$(<1.txt)
		avg_recv=$( bc <<< "$recv + $avg_recv ")

		grep "Packet_Delivery_Ratio:" tmp_result |  awk 'BEGIN{}{print $2;}' > 1.txt
		pdr=$(<1.txt)
		avg_pdr=$( bc <<< "$pdr + $avg_pdr ")

		grep "Control_Overhead:" tmp_result |  awk 'BEGIN{}{print $2;}' > 1.txt
		co=$(<1.txt)
		avg_co=$( bc <<< "$co + $avg_co ")

		grep "Normalized_Routing_Overhead:" tmp_result |  awk 'BEGIN{}{print $2;}' > 1.txt
		nro=$(<1.txt)
		avg_nro=$( bc <<< "$nro + $avg_nro ")

		grep "Delay:" tmp_result |  awk 'BEGIN{}{print $2;}' > 1.txt
		dl=$(<1.txt)
		avg_dl=$( bc <<< "$dl + $avg_dl ")

		grep "Throughput:" tmp_result |  awk 'BEGIN{}{print $2;}' > 1.txt
		tp=$(<1.txt)
		avg_tp=$( bc <<< "$tp + $avg_tp ")

		grep "Packet_Dropping_Ratio:" tmp_result |  awk 'BEGIN{}{print $2;}' > 1.txt
		pdrop=$(<1.txt)
		avg_pdrop=$( bc <<< "$pdrop + $avg_pdrop ")
		
		#Print all the values to CSV file.
		echo  "$i" | awk '{printf "\n%.5f", $1}' >> Output/Results/Final_Result.csv
		echo  "$send" | awk '{printf ", %.5f", $1}' >> Output/Results/Final_Result.csv
		echo  "$recv" | awk '{printf ", %.5f", $1}' >> Output/Results/Final_Result.csv
		echo  "$pdr" | awk '{printf ", %.5f", $1}' >> Output/Results/Final_Result.csv
		echo  "$co" | awk '{printf ", %.5f", $1}' >> Output/Results/Final_Result.csv
		echo  "$nro" | awk '{printf ", %.5f", $1}' >> Output/Results/Final_Result.csv
		echo  "$dl" | awk '{printf ", %.5f", $1}' >> Output/Results/Final_Result.csv
		echo  "$tp" | awk '{printf ", %.5f", $1}' >> Output/Results/Final_Result.csv
		echo  "$pdrop" | awk '{printf ", %.5f", $1}' >> Output/Results/Final_Result.csv
	done

#Print all the average values to CSV file.
echo  "" | awk '{printf "\nAverage", $1}' >> Output/Results/Final_Result.csv
echo  "$avg_send $count" | awk '{printf ", %.5f", $1/$2}' >> Output/Results/Final_Result.csv
echo  "$avg_recv $count" | awk '{printf ", %.5f", $1/$2}' >> Output/Results/Final_Result.csv
echo  "$avg_pdr $count" | awk '{printf ", %.5f", $1/$2}' >> Output/Results/Final_Result.csv
echo  "$avg_co $count" | awk '{printf ", %.5f", $1/$2}' >> Output/Results/Final_Result.csv
echo  "$avg_nro $count" | awk '{printf ", %.5f", $1/$2}' >> Output/Results/Final_Result.csv
echo  "$avg_dl $count" | awk '{printf ", %.5f", $1/$2}' >> Output/Results/Final_Result.csv
echo  "$avg_tp $count" | awk '{printf ", %.5f", $1/$2}' >> Output/Results/Final_Result.csv
echo  "$avg_pdrop $count" | awk '{printf ", %.5f", $1/$2}' >> Output/Results/Final_Result.csv

#Remove all temporary files.
rm 1.txt
rm tmp_result

#Move all output files to their locations.
mv *.nam Output/nam
mv *.tr Output/trace
mv *.txt Output/Results

#Generate and print graphs to their own .png file.
gnuplot gnuplot_script

echo "Completed successfully!"
