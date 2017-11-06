package cn.edu.zjut.po;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Entity;

public class Order implements Serializable{
	private int orderId;
	
	private Date submitTime;
	private Customer customer;
	private int orderStatu;
	private String orderPicSet;
	private String orderDescription;
	private String receiverName;
	private String phoneNumber;
	private String wayToSend;
	private String address;
	private int valiStatu;
	public Order(){
		
	}
	public Order(int orderId){
		this.orderId = orderId;
	}
	public Order(int orderId,Customer customer,Date submitTime,
			int orderStatu,String orderPicSet,String orderDescription,String receiverName,
			String phoneNumber,String wayToSend,String address,int valiStatu){
		this.orderId = orderId;
		this.customer = customer;
		this.submitTime = submitTime;
		this.orderStatu = orderStatu;
		this.orderPicSet = orderPicSet;
		this.orderDescription = orderDescription;
		this.receiverName = receiverName;
		this.wayToSend = wayToSend;
		this.address = address;
		this.valiStatu = valiStatu;
	}
	
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public Date getSubmitTime() {
		return submitTime;
	}
	public void setSubmitTime(Date submitTime) {
		this.submitTime = submitTime;
	}
	public int getOrderStatu() {
		return orderStatu;
	}
	public void setOrderStatu(int orderStatu) {
		this.orderStatu = orderStatu;
	}
	public String getOrderPicSet() {
		return orderPicSet;
	}
	public void setOrderPicSet(String orderPicSet) {
		this.orderPicSet = orderPicSet;
	}
	public String getOrderDescription() {
		return orderDescription;
	}
	public void setOrderDescription(String orderDescription) {
		this.orderDescription = orderDescription;
	}
	public String getReceiverName() {
		return receiverName;
	}
	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getWayToSend() {
		return wayToSend;
	}
	public void setWayToSend(String wayToSend) {
		this.wayToSend = wayToSend;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public int getValiStatu() {
		return valiStatu;
	}
	public void setValiStatu(int valiStatu) {
		this.valiStatu = valiStatu;
	}

}
