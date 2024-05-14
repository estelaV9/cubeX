package com.example.cubex.Controller;

import com.example.cubex.Database.DatabaseConnection;
import javafx.animation.KeyFrame;
import javafx.animation.Timeline;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.geometry.Pos;
import javafx.scene.control.ComboBox;
import javafx.scene.control.Label;
import javafx.scene.control.ListCell;
import javafx.scene.control.TextField;
import javafx.scene.layout.Pane;
import javafx.util.Duration;

import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Locale;
import java.util.ResourceBundle;

public class PageCtrller extends CodeGeneral implements Initializable {
    @FXML
    private Pane demoProfilePane;
    @FXML
    private Label chrono1Label;
    @FXML
    private TextField chronoPane;
    @FXML
    private ComboBox categoriesCB;
    @FXML
    private Label chrono;
    @FXML
    private Pane profilePage;



    @FXML
    void start(ActionEvent event) {
        CodeGeneral.start(chrono1Label);
    }

    @FXML
    void parar(ActionEvent event) {
        CodeGeneral.parar("chrono1Label");
    }

    @Override
    public void initialize(URL url, ResourceBundle resourceBundle) {
        closeBtt.setVisible(false);
        CodeGeneral.onFalseMenus(demoProfilePane, profilePage, settingMenu, optionMenu, optionDemoPane, timesMenu);
        scrambleLabel.setText(CodeGeneral.scramble());
        CodeGeneral.cubeCategory(categoriesCB);
    }
}
