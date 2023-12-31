package com.digitalproductsweb.model;

import java.sql.Date;

public class Album {
    private int id;
    private User user;
    private String title;
    private String description;
    private double price;
    private Date created_at;
    private Date updated_at;

    // Constructors
    public Album() {}

    public Album(int id, User user, String title, String description, double price, Date created_at, Date updated_at) {
        this.id = id;
        this.user = user;
        this.title = title;
        this.description = description;
        this.price = price;
        this.created_at = created_at;
        this.updated_at = updated_at;
    }

    public Album(User user, String title, String description, double price, Date created_at, Date updated_at) {
        this.user = user;
        this.title = title;
        this.description = description;
        this.price = price;
        this.created_at = created_at;
        this.updated_at = updated_at;
    }


    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Date getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Date created_at) {
        this.created_at = created_at;
    }

    public Date getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(Date updated_at) {
        this.updated_at = updated_at;
    }

    @Override
    public String toString() {
        return "Album{" +
                "id=" + id +
                ", user=" + user +
                ", title='" + title + '\'' +
                ", description='" + description + '\'' +
                ", price=" + price +
                ", created_at=" + created_at +
                ", updated_at=" + updated_at +
                '}';
    }
}
