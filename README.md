# CS549 Project

## Analysis of Ad-hoc On-demand Distance Vector (AODV) Protocol Using NS2 Simulations

## Objective:

The objective of this project is to conduct simulations on NS2 to analyze the performance of the Ad-hoc On-demand Distance Vector (AODV) protocol. The simulations will involve varying factors such as the number of nodes, node movement, and type of traffic. The key metrics to be recorded include delay, throughput, and packet loss. The results obtained will be used to draw inferences about the performance of the AODV protocol.

## Experiment Design:

1. Network Topology:
    - Set up a simulation scenario using NS2 with a defined area and node placement.
    - Configure the initial positions of nodes according to the desired network topology.
    - Define the communication range and channel characteristics.
2. AODV Protocol Configuration:
    - Configure NS2 to use the AODV routing protocol.
    - Set the AODV protocol parameters, such as route request timeout, hello interval, and other relevant settings, based on the desired experimental conditions.
3. Varying Factors:
    - Number of Nodes:
        - Set up experiments with different numbers of nodes [10, 20, 30, 40, 50, 60, 70, 80, 90, 100]
        - For each node count, run the simulation and record the performance metrics.
        - Repeat the experiments 10 times to ensure statistical validity.
    - Node Movement:
        - Perform experiments with different node movement speeds [0 m/s (static nodes), 5 m/s, 10 m/s]
        - For static scenarios, keep the nodes stationary throughout the simulation.
        - For dynamic scenarios, simulate node mobility by adjusting the node movement speed and pause time.
    - Type of Traffic:
        - Design experiments to evaluate the AODV protocol's performance using both UDP and TCP traffic.
        - Generate UDP traffic using the built-in “Application/Traffic/CBR” application in NS2.
        - Generate TCP traffic using the built-in “Appliction/TCP” application in NS2.
4. Performance metrics: 
    
    Measure and record the following metrics for each experiment:
    
    - Delay: Calculate the average end-to-end delay experienced by packets in the network.
    - Throughput: Determine the total amount of data successfully transmitted per unit of time.
    - Packet Loss: Track the number or percentage of lost packets during the simulation.
5. Data Analysis:
    
    Identify trends, patterns, and correlations in the results to draw meaningful conclusions using graphs about the performance of the AODV protocol under different conditions.
    

## Results:

### Table 1: Results for Varying Number of Nodes****

- Type of Traffic: CBR
- packet size: 512 bytes
- interval: 1 ms
- Node movement: 5 m/s

| No. of Nodes | Delay (sec) | Throughput (kbps) | Packet Loss (%) |
| --- | --- | --- | --- |
| 10 | 0.383 | 370.909 | 12.895 |
| 20 | 0.334 | 391.991 | 7.916 |
| 30 | 0.304 | 401.657 | 18.978 |
| 40 | 0.353 | 386.297 | 2.745 |
| 50 | 0.349 | 373.884 | 10.862 |
| 60 | 0.376 | 395.026 | 7.140 |
| 70 | 0.385 | 370.615 | 12.853 |
| 80 | 0.379 | 344.838 | 19.008 |
| 90 | 0.419 | 329.224 | 22.665 |
| 100 | 0.432 | 292.272 | 35.989 |

**Delay vs Number of Nodes:**

![delay1.jpeg](CS549%20Project%2084f25aa1819143b1aa38a89624eaf8bd/delay1.jpeg)

**Inference:**

- The delay generally decreases as the number of nodes increases, except for a slight increase with 40 nodes.
- This trend suggests that with a higher number of nodes, the AODV protocol is more efficient in establishing routes and transmitting packets, resulting in lower delays.
- The slight increase in delay with 40 nodes may indicate congestion or increased route discovery overhead in the network.

**Throughput vs Number of Nodes:**

![thr1.jpeg](CS549%20Project%2084f25aa1819143b1aa38a89624eaf8bd/thr1.jpeg)

**Inference:**

- The throughput initially increases as the number of nodes increases, reaching its peak around 30 nodes, and then slightly decreases afterward.
- This pattern indicates that up to a certain point, increasing the number of nodes improves the overall network capacity and data transmission rates.
- However, beyond a certain node count, the network may become congested or experience increased interference, resulting in a slight decrease in throughput.

Packet Loss vs Number of Nodes:

![pkt1.jpeg](CS549%20Project%2084f25aa1819143b1aa38a89624eaf8bd/pkt1.jpeg)

**Inference:**

- The packet loss shows a fluctuating pattern with increasing numbers of nodes.
- Initially, the packet loss decreases until around 40 nodes and then starts to increase.
- This suggests that the AODV protocol performs better with fewer nodes, achieving lower packet loss rates.
- As the network becomes more crowded with nodes, congestion and route instability may lead to higher packet loss rates.

### Table 2: Results for Varying Node Movement (m/s)

- Number of Nodes: 50
- Type of Traffic: CBR
- packet size: 512 bytes
- interval: 1 ms

| Node Movement (m/s) | Delay (sec) | Throughput (kbps) | Packet Loss (%) |
| --- | --- | --- | --- |
| 0 | 0.254 | 347.083 | 9.397 |
| 5 | 0.401 | 374.210 | 10.664 |
| 10 | 0.470 | 378.763 | 18.809 |

**Delay vs Node Movement:**

![delay2.jpeg](CS549%20Project%2084f25aa1819143b1aa38a89624eaf8bd/delay2.jpeg)

**Inference:**

- As the node movement speed increases from 0 m/s to 5 m/s and then to 10 m/s, the delay also increases.
- This suggests that higher node movement speeds introduce additional challenges in establishing and maintaining stable routes, resulting in increased delays.
- The difference in delay between 0 m/s and 10 m/s node movement speed is more pronounced, indicating that faster node movement has a more significant impact on delay.

**Throughput vs Node Movement:**

![thr2.jpeg](CS549%20Project%2084f25aa1819143b1aa38a89624eaf8bd/thr2.jpeg)

**Inference:**

- The throughput shows a decreasing trend as the node movement speed increases.
- This indicates that higher node movement speeds contribute to reduced overall network capacity and lower data transmission rates.
- Fast-moving nodes may experience more frequent link breakages or increased interference, leading to lower throughput.

**Packet Loss vs Node Movement:**

![pkt2.jpeg](CS549%20Project%2084f25aa1819143b1aa38a89624eaf8bd/pkt2.jpeg)

**Inference:**

- The packet loss increases as the node movement speed increases.
- This suggests that faster node movement speeds result in a higher likelihood of packet loss due to increased link instabilities and difficulty in maintaining reliable communication.
- The difference in packet loss between 0 m/s and 10 m/s node movement speed is more significant, indicating that faster node movement has a more pronounced effect on packet loss.

### Table 3: Results for Different Types of Traffic

- Number of Nodes: 50
- packet size for UDP: 512 bytes
- interval for UDP: 1 ms
- Node movement: 5 m/s

| Type of Traffic | Delay (sec) | Throughput (kbps) | Packet Loss (%) |
| --- | --- | --- | --- |
| UDP | 0.192 | 489.656 | 14.459 |
| TCP | 0.361 | 415.186 | 0.160 |

**Delay vs Type of Traffic:**

![delay3.jpeg](CS549%20Project%2084f25aa1819143b1aa38a89624eaf8bd/delay3.jpeg)

**Inference:**

- The delay for UDP traffic is significantly lower compared to TCP traffic.
- UDP, being a connectionless protocol, does not have the overhead of congestion control and reliable delivery mechanisms, resulting in lower delay.
- TCP, being a reliable and connection-oriented protocol, incurs additional delay due to acknowledgment and retransmission processes.

**Throughput vs Type of Traffic:**

![thr3.jpeg](CS549%20Project%2084f25aa1819143b1aa38a89624eaf8bd/thr3.jpeg)

**Inference:**

- The throughput for UDP traffic is higher compared to TCP traffic.
- UDP, not having congestion control mechanisms, can transmit data more aggressively and utilize available bandwidth, resulting in higher throughput.
- TCP, with its congestion control mechanisms, may reduce the sending rate in response to congestion, leading to lower throughput.

**Packet Loss vs Type of Traffic:**

![pkt3.jpeg](CS549%20Project%2084f25aa1819143b1aa38a89624eaf8bd/pkt3.jpeg)

**Inference:**

- The packet loss is higher for UDP traffic compared to TCP traffic.
- UDP, lacking retransmission mechanisms, is more susceptible to packet loss.
- TCP, with its reliable delivery mechanisms and retransmission of lost packets, achieves significantly lower packet loss.

## Conclusion:

Through the analysis of the Ad-hoc On-demand Distance Vector (AODV) protocol using NS2 simulations, we gained valuable insights into its performance under various conditions. The experiments involved varying the number of nodes, node movement speeds, and types of traffic to evaluate key performance metrics such as delay, throughput, and packet loss.

The results obtained revealed important trends and patterns. Increasing the number of nodes generally led to a decrease in delay, an initial increase and subsequent decrease in throughput, and fluctuating packet loss rates. Node movement speed showed a direct impact on delay, throughput, and packet loss, with higher speeds resulting in increased values for these metrics. Comparing UDP and TCP traffic, UDP demonstrated lower delay, higher throughput, and higher packet loss compared to TCP.

Overall, the AODV protocol exhibited better performance with a higher number of nodes, slower node movement speeds, and TCP traffic. These findings highlight the importance of considering network topology, node mobility, and traffic type when analyzing the performance of the AODV protocol.

## Future Work and Potential Extensions:

The analysis of the AODV protocol using NS2 simulations provides valuable insights, but further work can enhance our understanding. Future research can explore additional performance metrics such as network stability, energy efficiency, and scalability. Evaluating the impact of routing parameters on the protocol's behavior can shed light on its sensitivity and robustness. Additionally, investigating the AODV protocol in dynamic and heterogeneous environments, considering node mobility patterns and different node types, can provide a more comprehensive understanding. This project serves as a foundation for researchers to delve deeper into the AODV protocol's performance, aiming to improve its efficiency and effectiveness in ad-hoc networks.
