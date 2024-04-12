package com.angular.angconnection;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity @Table
@AllArgsConstructor @NoArgsConstructor
@Builder @Data
public class Model {

    @Id
    @GeneratedValue(strategy =  GenerationType.IDENTITY)
    private int id;

    String name;
    String phone;
}
