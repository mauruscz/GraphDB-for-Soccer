## OD -- OPEN DATA

### Document Description:

The repository is contains the following documents:

* In [data]() are contained three `.csv` files. `top250-00-19` and `transfers-all.csv` are the 2 datasets that will be integrated. `transfers.csv` is the result of integrating both datasets.

* In [imgs]() are contained the models included in the report, and the draw.io document to create them.

* In [results]() is stored the `.csv` files obtained when executing the queries and algorithms mentioned in the report.

* [Integration.R]() contains the code tat integrates both data sources into one, generates the resulting `.csv`, and stores it to the data folder.

* [GraphCreationQueries.ipynb]() is a jupyter notebook that will create all the nodes and edges in the Neo4j graph.

* [Queries]() is the document that contains the queries and algorithms explained in the report

* [ProjectStatement]() is the statement of the project created by the OD professors.

* [Report]() is the final report delivered by the students in learnSQL.

### Execution process:

In order to execute the proof of concept, you have to follow the next steps:
 1. Clone this repository:
    ```sh
    $ git clone https://github.com/oriolborrellroig/OD-FinalProject.git
    ```
 2. If you want to generate the integration process, open the [Integration.R]() file run all the lines. The output will be stored in In [data/transfers.csv](). However, the `.csv` document is already generated and the result must not differ.

 3. Copy the [data/transfers.csv]() into the Neo4j input folder.

 4. In order to create the graph, open the [GraphCreationQueries.ipynb]() and execute all the cells in order. To execute the cells you will to have install `py2neo`.

 5. Once created the graph execute the queries contained in the [Queries]() document in the Neo4j console. He have already executed the queries and algorithms, and the results are contained in the folder [results]()



### Authors:
 * Giovanni Mauro
 * Anass Benali
 * Oriol Borrell

