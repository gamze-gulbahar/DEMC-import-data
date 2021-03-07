echo "Creating database with name $3"
mysql -u$1 -p$2 -e "create database if not exists $3"

echo "Creating tables"
mysql -u$1 -p$2 $3 < imdb.sql

echo "Importing name_basics table"
mysql -u$1 -p$2 -D $3 -e "LOAD DATA LOCAL INFILE 'name.basics.tsv' INTO TABLE name_basics FIELDS TERMINATED BY '\t' LINES TERMINATED BY '\n' IGNORE 1 ROWS;"

echo "Importing title_ratings table"
mysql -u$1 -p$2 -D $3 -e "LOAD DATA LOCAL INFILE 'title.ratings.tsv' INTO TABLE title_ratings FIELDS TERMINATED BY '\t' LINES TERMINATED BY '\n' IGNORE 1 ROWS;"

echo "Importing title_principals table"
mysql -u$1 -p$2 -D $3 -e "LOAD DATA LOCAL INFILE 'title.principals.tsv' INTO TABLE title_principals FIELDS TERMINATED BY '\t' LINES TERMINATED BY '\n' IGNORE 1 ROWS;"

echo "Importing title_basics table"
mysql -u$1 -p$2 -D $3 -e "LOAD DATA LOCAL INFILE 'title.basics.tsv' INTO TABLE title_basics FIELDS TERMINATED BY '\t' LINES TERMINATED BY '\n' IGNORE 1 ROWS;"

echo "Importing title_akas table"
mysql -u$1 -p$2 -D $3 -e "LOAD DATA LOCAL INFILE 'title.akas.tsv' INTO TABLE title_akas FIELDS TERMINATED BY '\t' LINES TERMINATED BY '\n' IGNORE 1 ROWS;"

echo "Importing title_episode table"
mysql -u$1 -p$2 -D $3 -e "LOAD DATA LOCAL INFILE 'title.episode.tsv' INTO TABLE title_episode FIELDS TERMINATED BY '\t' LINES TERMINATED BY '\n' IGNORE 1 ROWS;"
