package com.bsc.beans;

public class Movies {

	
	private int MovieID;
	private String Title;
	private String Description;
	private String ReleaseDate;
	private int Classification;
	private String Genre;
	private String ImageLandscape;
	private String ImagePortrait;
	
	
	public Movies(int movieID, String title, String description, String releaseDate, int classification, String genre, String imageLandscape, String imagePortrait) {
		this.MovieID = movieID;
		this.Title = title;
		this.Description = description;
		this.ReleaseDate = releaseDate;
		this.Classification = classification;
		this.Genre = genre;
		this.ImageLandscape = imageLandscape;
		this.ImagePortrait = imagePortrait;
	}
	
	public int getMovieID() {
		return MovieID;
	}
	public void setMovieID(int movieID) {
		MovieID = movieID;
	}
	public String getTitle() {
		return Title;
	}
	public void setTitle(String title) {
		Title = title;
	}
	public String getDescription() {
		return Description;
	}
	public void setDescription(String description) {
		Description = description;
	}
	public String getReleaseDate() {
		return ReleaseDate;
	}
	public void setReleaseDate(String releaseDate) {
		ReleaseDate = releaseDate;
	}
	public int getClassification() {
		return Classification;
	}
	public void setClassification(int classification) {
		Classification = classification;
	}
	public String getGenre() {
		return Genre;
	}
	public void setGenre(String genre) {
		Genre = genre;
	}
	public String getImageLandscape() {
		return ImageLandscape;
	}
	public void setImageLandscape(String imageLandscape) {
		ImageLandscape = imageLandscape;
	}
	public String getImagePortrait() {
		return ImagePortrait;
	}
	public void setImagePortrait(String imagePortrait) {
		ImagePortrait = imagePortrait;
	}
	
}