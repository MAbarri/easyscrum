//package com.sqli.easyscrum.entity;
//
//import java.sql.Timestamp;
//import java.util.Date;
//
//import javax.persistence.Column;
//import javax.persistence.MappedSuperclass;
//import javax.persistence.PrePersist;
//import javax.persistence.PreUpdate;
//
///**
// * @author Marrafi
// *
// */
//@MappedSuperclass
//public abstract class BaseEntity {
//	/**
//	 * Update date
//	 */
//	private Timestamp dateMajTech;
//	/**
//	 * Creation date
//	 */
//	private Timestamp dateCreaTech;
//
//	/**
//	 * @return the dateMajTech
//	 */
//	@Column(name = "update_ts", insertable = false, updatable = true)
//	Timestamp getDateMajTech() {
//		return dateMajTech;
//	}
//
//	/**
//	 * @param dateMajTech
//	 *            the dateMajTech to set
//	 */
//	void setDateMajTech(Timestamp dateMajTech) {
//		this.dateMajTech = dateMajTech;
//	}
//
//	/**
//	 * @return the dateCreaTech
//	 */
//	@Column(name = "creation_ts", insertable = true, updatable = false)
//	Timestamp getDateCreaTech() {
//		return dateCreaTech;
//	}
//
//	/**
//	 * @param dateCreaTech
//	 *            the dateCreaTech to set
//	 */
//	void setDateCreaTech(Timestamp dateCreaTech) {
//		this.dateCreaTech = dateCreaTech;
//	}
//
//	@PrePersist
//	void onCreate() {
//		this.setDateCreaTech(new Timestamp((new Date()).getTime()));
//	}
//
//	@PreUpdate
//	void onPersist() {
//		this.setDateMajTech(new Timestamp((new Date()).getTime()));
//	}
//}
//
