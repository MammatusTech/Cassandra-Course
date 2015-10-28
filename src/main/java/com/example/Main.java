package com.example;

import com.datastax.driver.core.Cluster;
import com.datastax.driver.core.ResultSet;
import com.datastax.driver.core.Session;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


public class Main {


    static final Logger logger = LoggerFactory.getLogger(Main.class);


        public static void main(String args[]){

            TodoItem item = new TodoItem("George", "Buy a new computer", "Shopping");
            TodoItem item2 = new TodoItem("John", "Go to the gym", "Sport");
            TodoItem item3 = new TodoItem("Ron", "Finish the homework", "Education" );

//            System.out.println(item);
//            System.out.println(item2);
//            System.out.println(item3);


            //create keyspace
//            String keyspace = "CREATE KEYSPACE todolist WITH replication "
//                    + "= {'class':'SimpleStrategy', 'replication_factor':1}; ";

            String keyspace = "CREATE KEYSPACE IF NOT EXISTS todolist  WITH replication = {'class': 'SimpleStrategy', 'replication_factor':1}";

            //index data
            String task1 = "INSERT INTO todolisttable (ID, Description, Category, Date)"

                    + item.toString();

            String task2 = "INSERT INTO todolisttable (ID, Description, Category, Date)"

                    + item2.toString();

            String task3 = "INSERT INTO todolisttable (ID, Description, Category, Date)"

                    + item3.toString();


            //delete keyspace
            String deletekeyspace = "DROP KEYSPACE todolist";

            //delete table
            String deletetable = "DROP TABLE todolisttable";

            //create table
            String table = "CREATE TABLE todolisttable(ID text PRIMARY KEY, "
                    + "Description text, "
                    + "Category text, "
                    + "Date timestamp )";

            //Query all data
            String query = "SELECT * FROM todolisttable";

            //Update table
            String update = "UPDATE todolisttable SET Category='Fun',Description='Go to the beach' WHERE ID='Ron'";

            //Deleting data where the index id = George
            String delete = "DELETE FROM todolisttable WHERE ID='George'";

            //Deleting all data
           String deleteall ="TRUNCATE todolisttable";


//----------------------------------------------------------------------------------------------------------------------------


            //Creating Cluster object
            Cluster cluster = Cluster.builder().addContactPoint("127.0.0.1").build();


            //Creating Session object
            Session session = cluster.connect();



            //create keyspace
            session.execute(keyspace);
            System.out.println("\nKeysapace todolist is created");

            //using the KeySpace
            session.execute("USE todolist");


            //Create table
            session.execute(table);


            //indexing data
            session.execute(task1);
            session.execute(task2);
            session.execute(task3);

            System.out.println("\nDATA CREATED and INDEXED\n");

            //the result of queries will be in the form of a ResultSet object
            ResultSet data = session.execute(query);

            System.out.println("Query all data on cassandra after the initial indexing:\n" + data.all());

            //Updating the data
            session.execute(update);

            //query all data again
            ResultSet data1 = session.execute(query);

            //testing logging
            logger.debug("testing", data1);

            System.out.println("\nQuery data after updating the table where ID=Ron:\n" + data1.all() );

            //deleting data where ID= George
            session.execute(delete);

            //query all data after deleting
            ResultSet data2 = session.execute(query);
            System.out.println("\nQuery data after deleting the entry with id=george:\n" + data2.all());

            //deleting all data from table
            session.execute(deleteall);

            //query all data after deleting everything
            ResultSet data3 = session.execute(query);
            System.out.println("\nQuery data after deleting everything:\n" + data3.all());

            //SHUT DOWN-----------------

            //deleting table todolisttable
            session.execute(deletetable);
            //deleting keyspace
            session.execute(deletekeyspace);
            //close session
            session.close();
            //close cluster
            cluster.close();

        }
    }



