create table name_basics(nconst varchar(100) not null , primary_name varchar(200), birth_year int(5), death_year int(5), primary_profession varchar(300), known_for_titles varchar(500), primary key (nconst));


create table title_ratings(tconst varchar(100) not null, average_rating float, num_votes int, primary key (tconst));

create table title_basics(tconst varchar(100) not null , title_type varchar(50), primary_title varchar(200), original_title varchar(200), is_adult tinyint, start_year int, end_year int, runtime_minutes int, genres varchar(200), primary key (tconst), index (primary_title));

create table title_principals(tconst varchar(100) not null, ordering int, nconst varchar(100), category varchar(300), job varchar(300), characters varchar(300), foreign key (tconst) references title_basics(tconst), foreign key (nconst) references name_basics(nconst));
	
create table title_episode(tconst varchar(100) not null, parent_tconst varchar(100) not null, season_number int, episode_number int, foreign key (tconst) references title_basics(tconst),foreign key (parent_tconst) references title_basics(tconst));

create table title_akas(tconst varchar(100) not null , ordering int, title varchar(200), region varchar(100), language varchar(100), types varchar(200), attributes varchar(200), is_original_title tinyint(1),foreign key (tconst) references title_basics(tconst));
