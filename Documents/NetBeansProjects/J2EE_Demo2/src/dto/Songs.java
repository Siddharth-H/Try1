/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import java.util.*;
/**
 *
 * @author Siddharth
 */
public class Songs {
    private int id;
    private String title;
    private String genre;
    private String album;
    private int year;
    private double length;
    private String artist;

    public Songs() {
    }

    public int getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public String getGenre() {
        return genre;
    }

    public String getAlbum() {
        return album;
    }

    public int getYear() {
        return year;
    }

    public double getLength() {
        return length;
    }

    public String getArtist() {
        return artist;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public void setAlbum(String album) {
        this.album = album;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public void setLength(double length) {
        this.length = length;
    }

    public void setArtist(String artist) {
        this.artist = artist;
    }
    
    
    
}
