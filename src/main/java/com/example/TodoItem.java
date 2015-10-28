package com.example;


import java.time.LocalDateTime;

/**
 * Created by fadi on 5/17/15.
 */
public class TodoItem {


    private String id;
    private String description;
    private String category;
    private final LocalDateTime date = LocalDateTime.now();


    public TodoItem(String id, String description, String category) {
        this.id = id;
        this.description = description;
        this.category = category;


    }

    public String getId(){
        return this.id;
    }

    public  String getDescription(){
        return this.description;
    }

    public String getCategory(){
        return this.category;
    }

//    @Field
//    public void setId(String id){
//        this.id = id;
//    }
//
//    @Field
//    public void setDescription(String description){
//        this.description = description;
//    }
//    @Field
//    public void setCategory(String category){
//        this.category = category;
//    }


    @Override
    public String toString() {
        return  "VALUES ( " + "'" + this.id +"'" + ", " + "'" + this.description +"'" + ", " + "'" + this.category +"'" +", "  + "'" + date +"'" + ")";

    }
}




