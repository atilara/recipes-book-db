FROM neo4j:latest

ENV NEO4J_ACCEPT_LICENSE_AGREEMENT=yes
ENV NEO4J_HOME="/var/lib/neo4j"
ENV NEO4J_dbms_security_auth__minimum__password__length=1
ENV ROOT_PASS=root
ENV NEO4J_AUTH=neo4j/${ROOT_PASS}
   
COPY cleaned_indian_food_dataset.csv ${NEO4J_HOME}/import/cleaned_indian_food_dataset.csv
COPY neo4j-init.cypher ${NEO4J_HOME}/import/neo4j-init.cypher
COPY wrapper.sh wrapper.sh

ENTRYPOINT ["./wrapper.sh"]
