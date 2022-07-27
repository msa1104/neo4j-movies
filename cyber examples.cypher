//M - Movies starting with the

MATCH (m:Movie)
WHERE m.title starts with 'The'
return m.title

// Q - All title of Keanu reeves or cast of Matrix
MATCH (p:Person) <- [a:ACTED_IN] -> (m:Movie)
where p.name = 'Keanu Reeves' or m.title = 'The Matrix'
return p.name, m.title


// Q - Same director and actor
MATCH (p:Person)<-[:ACTED_IN]->(m:Movie)-[:DIRECTED]-(d:Person)
where p.name = d.name
RETURN m.title, p.name as actor, d.name as director

// Q - Same person (more than 1 relation)
MATCH (p:Person)-[r]-(m:Movie)
WITH p, m, count(r) as relation_count
where relation_count > 1
RETURN p.name, m.title, relation_count

// Q1 - list of movies with certain actor
MATCH (p:Person)-[:ACTED_IN]-(m:Movie)
where p.name = 'Keanu Reeves' 
return p.name, m.title

// Q1 - list of movies with certain actor
MATCH (p:Person{name:'Keanu Reeves'})-[:ACTED_IN]-(m:Movie)
return p.name, m.title

// Q1 - list of movies with certain actor
MATCH (p:Person{name:'Keanu Reeves' })-[:ACTED_IN]-(m:Movie)
where m.released > 2000 and m.released < 2022
return p.name, m.title

// Q2 - list of movies with certain director
MATCH (p:Person{name:'Lana Wachowski'})-[:DIRECTED]-(m:Movie)
return p.name, m.title

//Q4 - which director produced max movies

MATCH (m:Movie) - [pd:PRODUCED] - (p:Person)
return p.name, count(m.title) as count_movies
order by count_movies desc
limit (1)

// Q5 - Same person (more than 1 relation - actor/director/producer)
MATCH (p:Person)-[r]-(m:Movie)
WITH p, m, count(r) as relation_count
where relation_count > 1
RETURN p.name, m.title, relation_count

// Q5 - Same person (more than 1 relation - actor/director/producer)
MATCH (p:Person)-[r]-(m:Movie)
WITH p, m, count(r) as relation_count
where relation_count > 1
RETURN p.name, m.title, relation_count

// total movie nodes
MATCH (m:Movie)
return count(m)


//total nodes
MATCH (n)
RETURN count(*) as total_nodes;


// total person nodes
MATCH (p:Person)
return count(p)