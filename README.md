# Web-docker-tickstack

Dashboard Stack installation on Docker i.e Telegraf, InfluxDB, Chronograf and, Grafana.

## Prerequisites

You should have installed docker on your pc either on window, linux or mac. You can download it from
https://docs.docker.com/engine/install/
If you are using windows download and install git on your pc. You can download git from
https://git-scm.com/downloads
On windows, have Gitbash or powershell to run commands on the terminal.

### Installing the whole Stack from docker

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
5. http://localhost:1883 - open mosquitto broker
6. http://localhost:8883 - protected mosquitto broker

### InfluxDB
- InfluxDB Will be set once you pull the repository. You don't have to set it.


### Grafana

- Start Grafana on http://localhost:3000.
- Use the below credentials on first start
  ```sh
  username - admin
  password - admin
  ```

#### Setting a data sources on Grafana
- After you have successfully logged in as an admin you will need to connect to a data source to be able to view metrics on dashboards. To do so you need to set up the data source for the following:

##### InfluxDB Datasource

  - Once you have logged in, on the sidebar under configurations open data sources page.
  - On Data Sources, click add data source.
  - Search for Influxdb and select it.
  - Under influxdb settings, add the following:
  
    ```sh
    Name: Oves InfluxDB Datasource
    Query Language: InfluxQL
    HTTP:
      url: http://influxdb:8086
    InfluxDB Details:
      Database: telegraf
      User: telegraf
      Password: telegraf
    ```
  - Save & Test
  - You will get an acknowledge message if everything is set correctly.
  - You can now create your first dashboard while fetching data from influxdb.

##### GraphQL Datasource
  Prerequistes for GraphQL Datasource
      - Have installed the GraphQL data source Plugin and Installed it. If not use the below Link to install the plugin
          https://grafana.com/grafana/plugins/fifemon-graphql-datasource/
      - Also have an endpoint to your GraphQL APi.
      - Access Token of the API Endpoint.(Admin Access Token)

  Setting up
      - Open data sources page.
      - On Data Sources, click add data source.
      - Search for GraphQl and select it.
      - Under GraphQl settings, add the following:
          ```sh
          Name: Oves GraphQL Datasource
          HTTP:
              url: https://dev-microservices-apigateway.omnivoltaic.com/graphql
          Custom HTTP Headers:
              Header: Authorization
              Value: Bearer {Accesstoken}
          ```
      - Save & Test
      - You will get an acknowledge message if everything is set correctly.
      - You can now create your first dashboard while fetching data from GraphQL.

## Getting latest changes from repository

- When new changes have been pushed to the repository, you will need to pull them to your local enviroment to get the new changes.
- To get new changes use the below commands:
  - Use this command to pull changes from github
    ```sh
    git pull
    ```
  - After new changes have been updated on local environment, restart the containers to load the new changes.
  
    ```sh
    docker-compose up -d
    ```
