package com.bobochang.warehouse.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class TaskDTO {
    private String id;
    private String name;
    private String assignee;
    // Other relevant fields

    // Getters and setters
}