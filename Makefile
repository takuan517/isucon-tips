# Install alp
alp:
	./scripts/alp.sh

# Install htop
htop:
	./scripts/gtop.sh

netdata:
	./scripts/netdata.sh

install:
	ln -s ./bin ~/.bin

# mydql関連

MYSQL_HOST="127.0.0.1"
MYSQL_PORT=3306
MYSQL_USER=isucon
MYSQL_DBNAME=isucondition
MYSQL_PASS=isucon

MYSQL=mysql -h$(MYSQL_HOST) -P$(MYSQL_PORT) -u$(MYSQL_USER) -p$(MYSQL_PASS) $(MYSQL_DBNAME)
SLOW_LOG=/tmp/slow-query.log

.PHONY: slow-on
slow-on:
	sudo rm $(SLOW_LOG)
	sudo systemctl restart mysql
	$(MYSQL) -e "set global slow_query_log_file = '$(SLOW_LOG)'; set global long_query_time = 0.001; set global slow_query_log = ON;"

.PHONY: slow-off
slow-off:
	$(MYSQL) -e "set global slow_query_log = OFF;"

.PHONY: slow-show
slow-show:
	./bin/mysqlshow
