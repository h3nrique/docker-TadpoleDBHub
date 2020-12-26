Docker-Tadpole DB Hub
==

Tadpole DB Hub(https://github.com/hangum/TadpoleForDBTools) is Unified infrastructure tool, various environment based interface for managing <b>Apache Hive, Apache Tajo, Amazon RDS, MySQL, MariaDB, Oracle, SQLite, MSSQL, PostgreSQL, CUBRID and MongoDB</b> databases. It enables you to handle typical DB over the World Wide Web.

Fork of https://github.com/hangum/docker-TadpoleDBHub

Docker Hub 
- 
* https://hub.docker.com/r/h3nrique/tadpolehub

Image build
-
```bash
docker build -t h3nrique/tadpolehub:latest .
```

Image run
-
```bash
docker run --name tadpolehub -p 8180:8080 -d h3nrique/tadpolehub:latest
```

OCP Deploy
-
```bash
oc new-app https://github.com/h3nrique/docker-TadpoleDBHub.git --name tadpolehub --strategy=docker
```

License
-
* LGPL(Lesser General Public License)
