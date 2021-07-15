## GRAPH DB FOR SOCCER

### Authors:
 * Giovanni Mauro
 * Anass Benali
 * Oriol Borrell


### Document Description:

The repository contains the following documents:

* In [data](https://github.com/oriolborrellroig/OD-FinalProject/tree/master/data) there are three `.csv` files. `top250-00-19` and `transfers-all.csv` are the 2 datasets that will be integrated. `transfers.csv` is the result of integrating both datasets.

* In [imgs](https://github.com/oriolborrellroig/OD-FinalProject/tree/master/imgs) are contained the models included in the report, and the draw.io document to create them.

* In [results](https://github.com/oriolborrellroig/OD-FinalProject/tree/master/results) is stored the `.csv` files obtained when executing the algorithms mentioned in the report.

* [Integration.R](https://github.com/oriolborrellroig/OD-FinalProject/blob/master/Integration.R) contains the code that integrates both data sources into one, generates the resulting `.csv`, and stores it to the data folder.

* [GraphCreationQueries.ipynb](https://github.com/oriolborrellroig/OD-FinalProject/blob/master/GraphCreationQueries.ipynb) is a jupyter notebook that will create all the nodes and edges in the Neo4j graph.

* [QueriesAlgorithms.ipynb](https://github.com/oriolborrellroig/OD-FinalProject/blob/master/QueriesAlgorithms.ipynb) is a jupyter notebook that contains the queries and algorithms explained in the report.

* [ProjectStatement](https://github.com/oriolborrellroig/OD-FinalProject/blob/master/ProjectStatement.pdf) is the statement of the project created by the OD teachers.

* [Report](https://github.com/oriolborrellroig/OD-FinalProject/blob/master/Report.pdf) is the final report delivered by the students in LearnSQL.

### Configuration:
To execute the Python Notebook:
 1. Make sure to have `py2neo` installed (pip install py2neo).
 2. Introduce the graph credentials in the first notebook cell.
 3. Start Neo4j.
 4. Start a graph project.
 4. Run the notebook code.
 
To execute the algorithms offered by Neo4j:
 1. Locate the plugins folder and download the jar file corresponding to your Neo4j version. For instance,
 [graph-algorithms-algo-3.5.4.0.jar](https://github.com/neo4j-contrib/neo4j-graph-algorithms/releases/download/3.5.4.0/graph-algorithms-algo-3.5.4.0.jar).
 2. Locate the neo4j.conf file and add the following line:
    ```sh
    dbms.security.procedures.unrestricted=algo.*
    ```
 3. Restart Neo4j.

### Execution process:

In order to execute the proof of concept, you have to follow the next steps:
 1. Clone this repository:
    ```sh
    $ git clone https://github.com/oriolborrellroig/OD-FinalProject.git
    ```
 2. If you want to generate the integration process, open the [Integration.R](https://github.com/oriolborrellroig/OD-FinalProject/blob/master/Integration.R) file run all the lines. The output will be stored in In [data/transfers.csv](https://github.com/oriolborrellroig/OD-FinalProject/blob/master/data/transfers.csv). However, the `.csv` document is already generated and the result must not differ.

 3. Copy the [data/transfers.csv](https://github.com/oriolborrellroig/OD-FinalProject/blob/master/data/transfers.csv) into the Neo4j 'import' folder.

 4. In order to create the graph, open the [GraphCreationQueries.ipynb](https://github.com/oriolborrellroig/OD-FinalProject/blob/master/GraphCreationQueries.ipynb) and execute all the cells in order. To execute the cells you will to have install `py2neo`.

 5. Once created the graph execute the queries contained in the [QueriesAlgorithms](https://github.com/oriolborrellroig/OD-FinalProject/blob/master/QueriesAlgorithms.ipynb) document in the Neo4j console. He have already executed the queries and algorithms, and the results are contained in the folder [results](https://github.com/oriolborrellroig/OD-FinalProject/tree/master/results)

