use dcproject_1;
select * from Anime_SQL_Project;
## total records
select count(*) from Anime_SQL_Project;

## types in anime data set
select distinct type from Anime_SQL_Project;

##typewise anime count
select type ,count(type)
from Anime_SQL_Project
group by type;

## to see particular anime type
select * from Anime_SQL_Project
where type = 'music'
order by anime_id;

## highest rated anime
select anime_name,type,rating from Anime_SQL_Project
order by rating desc
limit 10;

## lowest rated anime
select anime_name,type,rating from Anime_SQL_Project
order by rating asc
limit 10;

## avg rating in anime
select round(avg(rating)) from Anime_SQL_Project;

## most popular anime(members)
select anime_name,members from Anime_SQL_Project
order by members desc
limit 10;

##highest episods anime
select anime_name,episodes from Anime_SQL_Project
order by episodes desc
limit 10;

## to see typewise avg rating
select type,round(avg(rating),2) from Anime_SQL_Project
group by type;

## typewise avg members
select type,round(avg(members),2) from Anime_SQL_Project
group by type;

## rating anime count > 8
select count(*) from Anime_SQL_Project
where rating > 8;

##to see anime where episods are >50
select anime_name,episodes from  Anime_SQL_Project 
where episodes > 50;

## to see top 5 genres
select genre,count(*) as top_5_genre from Anime_SQL_Project
group by genre
order by top_5_genre desc
limit 5;

## to see top 10 anime in each type
select anime_name,type,rating from
(
select anime_name,type,rating,
row_number() over(partition by type order by rating desc) as rn
from Anime_SQL_Project
) 
as ranked
where rn<=10;


