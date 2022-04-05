# Web-docker-tickstack
Tick Stack installation on Docker i.e Telegraf, InfluxDB, Chronograf, Kapacitor and, Grafana.

## Prerequisites
You should have installed docker on your pc either on window, linux or mac. You can download it from
https://docs.docker.com/engine/install/
If you are using windows download and install git on your pc. You can download git from
https://git-scm.com/downloads
On windows, have Gitbash or powershell to run commands on the terminal.

### Installation
1. On your terminal(gitbash or powershell), clone the repo using the code
  ```sh
  git clone https://github.com/ovesorg/web-docker-tickstack.git
  ```
2. Change the directory to the cloned repo
  ```sh
  cd web-docker-tickstack
  ```
3. Run the command to get all the tick-stack images and start them
  ```sh
  docker-compose up -d
  ```
  N/B
  The first time you run this command it will take sometime to finish downloading the images.

### Ports
1. http://localhost:3000 - grafana
2. http://localhost:8888 - chronograf
3. http://localhost:8186 - telegraf
4. http://localhost:8086 - influxdb
5. http://localhost:1883 - mosquitto broker

### Running grafana
- Start Grafana on http://localhost:3000.
- Use the below credentials on first start
    ```sh
    username - admin
    password - admin
    ```
### Setting a data source on Grafana
- After you have successfully logged in as an admin you will need to connect to a data sources so be able to view metrics on dashboards. To do so you need to do the following:
  - Once you have logged in, on the sidebar under configurations open data sources page.
  - On Data Sources, click add data source.
  - Search for Influxdb and select it.
  - Under influxdb settings, add the following:
      ```sh
      Name: ADD ANY NAME
      HTTP:
        url: http://influxdb:8086
      InfluxDB Details:
        Database: telegraf
        User: telegraf
        password: telegraf
      ```
  - Save & Test
  - You will get an acknowledge message if everything is set correctly.
  - You can now create your first dashboard while fetching data from influxdb.
