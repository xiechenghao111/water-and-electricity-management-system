module com.example.fyp1 {
    requires javafx.controls;
    requires javafx.fxml;

    requires java.mail;
    requires java.sql;
    requires fastjson;
    requires jakarta.servlet;
    requires org.apache.commons.lang3;
    requires stripe.java;
    requires javax.servlet.api;
    requires org.apache.poi.poi;
    requires org.apache.commons.io;


    opens com.example.fyp1 to javafx.fxml;
    exports com.example.fyp1;
}