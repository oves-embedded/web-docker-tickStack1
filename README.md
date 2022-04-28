# Web-docker-tickstack

Tick Stack installation on Docker i.e Telegraf, InfluxDB, Chronograf, Kapacitor and, Grafana.

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
5. http://localhost:1883 - mosquitto broker

### Setting and running Influxdb2

- After starting the whole stack with Docker, Start Influxdb-client on the url http://localhost:8086
- On the first time you will need to setup your influxdb credentials. Use the following as default for all Oves users:

  ```sh
  Username: ovesadmin
  Password: oves1234
  org: oves
  bucket: oves-bucket
  ```

- After setting your influxdb credentials, go to quick start to start influxdb-client.
- Once started you will need to setup a few things before you can start viewing metrics.

#### Connecting influxdb to telegraf

- On the sidebar of influxdb-client, go to data and select Telegraf.
- Under telegraf submenu, Click on create configuration to create a new telegraf configuration inside influxdb.
- Once you click the create button, you will get a modal popup for you to select what you want to monitor. Select System and click continue.
- On the next page, rename your telegraf configuration file and description as follows:
  ```sh
  Telegraf config Name: Oves-Telegraf
  Telegraf config Description: Oves Telegraf Configuration
  ```
- Once you've added the Name and Description, click create and verify button.
- You will be redirected to another section to test your configuration.
- You cna click on the Listen For Data button to check if there is a connection. If successfully connected you will get the message connection found.
- Click finish if the connection is found to finish the setting up of the telegraf configuration.

#### Editing Telegraf Configuration

- Once you've created the Telegraf Configuration, you will need to copy the new telegraf configurations from web-docker-tickstack folder under the file called telegraf.conf.
- Copy the whole content from that file which has mqtt_consumer plugin to be used to capture mqtt metrics.
- On your influxdb-client, open the Telegraf Configuration you created.
- Paste all the contents you copied inside the Telegraf Configuration to overwrite the existing contents.
- After you have pasted the contents inside, save the changes.

#### Copying the Access Token

- Inorder for telegraf to communicate with Influxdb, we need an access token to authorize this.
- Back in influxdb-client, on the data sub menu, click API Tokens and open the Admin's Token.
- Copy the Access Token.
- Back on the project folder, paste Access Token you've just copied inside the .env file in the below line inside the .env file.
  ```sh
  DOCKER_INFLUXDB_INIT_ADMIN_TOKEN:PASTE_TOKEN_HERE
  ```
- Once you've copied the access token you can now be able to get data inside the Influxdb.

#### How to view measurements from mqtt_consumer

- Once you've copied your Access Token to the .env file, you will need to restart the docker containers.
- On the folder you cloned the ehole tick stack, run the below command to restart the containers to get the new changes
  ```sh
  docker-compose ps -d
  ```
- Once the containers are up again, go to influxdb-client(localhost:8086) and login.
- Once logged in, on the sidebar go to Explore submenu.
- Under the Data Explorer page, you can get to query for your data from the mqtt_consumer plugin.
- To query the data, do the following under Data Explorer:
  - Under the <b>FROM</b> section select <b>oves-bucket</b>
  - Under the first <b>Filter</b>, select <b>\_measurements</b> and select <b>mqtt_consumer</b>
  - Under the second <b>Filter</b>, select <b>\_field</b> and select the fields you want.
  - Under the third <b>Filter</b>, select <b>host</b> and it will have selected the host for you.
  - Under the fourth <b>Filter</b>, select <b>topic</b> and select the topic you want to query from.
  - Once you have everything checked, you can hit the submit button to get the query.
  - Or you can hit the script Editor to view the script that got generated after you filtered.

NB: If you are not able to view the measurements from mqtt_consumer you might have copied the telegraf configurations wrongly, cif so start again from the section <b>Editing Telegraf Configuration</b>

### Running grafana

- Start Grafana on http://localhost:3000.
- Use the below credentials on first start
  ```sh
  username - admin
  password - admin
  ```

#### Setting a data source on Grafana

- After you have successfully logged in as an admin you will need to connect to a data sources to be able to view metrics on dashboards. To do so you need to do the following:
  - Once you have logged in, on the sidebar under configurations open data sources page.
  - On Data Sources, click add data source.
  - Search for Influxdb and select it.
  - Under influxdb settings, add the following:
    ```sh
    Name: Oves Dashboard
    Query Language: Flux
    HTTP:
      url: http://influxdb:8086
    Auth: CHECK[BASIC AUTH]
    Basic Auth Details:
      user: INFLUXDB_USERNAME
      password: INFLUXDB_PASSWORD
      i.e
       Username: ovesadmin
       Password: oves1234
    InfluxDB Details:
      Organization: INFLUXDB_ORG i.e oves
      Token: INFLUXDB_ACCESS_TOKEN
      Default Bucket: INFLUXDB_BUCKET i.e oves-bucket
    ```
  - Save & Test
  - You will get an acknowledge message if everything is set correctly.
  - You can now create your first dashboard while fetching data from influxdb.

##### How to use flux to query data in grafana
- 

## Getting latest changes from repository

- When new changes have been pushed to the repository, you will need to pull them to your local enviroment to get the new changes.
- To get new changes use the below commands:
  - Use this command to stop the running containers
    ```sh
    docker-compose down
    ```
  - After all containers have stopped use this command to pull changes from github
    ```sh
    git pull
    ```
  - After new changes have been updated on local enviroment, start off the containers again which will be having new changes
    ```sh
    docker-compose up -d
    ```
