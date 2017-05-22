package com.fdmgroup.entity;

import java.math.BigDecimal;
import java.sql.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;


@Entity
@Table(name="PM_TRANSACTION")
@NamedQueries({@NamedQuery(name="transaction.findAll", query="SELECT tr FROM Transaction tr"),
	@NamedQuery(name="transaction.findByUserId", query="SELECT tr FROM Transaction tr WHERE tr.patient.id =:id"),
	@NamedQuery(name="transaction.findByDate ", query="SELECT tr FROM Transaction tr WHERE tr.date =:date")
	})
public class Transaction implements IStorable{
	
	@Id
	@Column(name="transaction_id")
	@SequenceGenerator(name="pm_transaction_sequence",sequenceName="PM_TRANSACTION_SEQ", allocationSize=1)
	@GeneratedValue(generator="pm_transaction_sequence", strategy=GenerationType.SEQUENCE)
	private long id;
	
	@ManyToOne(cascade= CascadeType.ALL, fetch= FetchType.LAZY)
	private User patient;
	
	@Column(name= "type")
	private TransactionType type;
	
	@Column(name= "amount")
	private BigDecimal amount;
	
	@Column(name= "date")
	private Date date;

	public Transaction() {
		this(null,null);
	}

	public Transaction( TransactionType type,  Date date) {
		super();
		this.patient = null;
		this.type = type;
		this.amount = BigDecimal.ZERO;
		this.date = date;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public User getPatient() {
		return patient;
	}

	public void setPatient(User patient) {
		this.patient = patient;
	}

	public TransactionType getType() {
		return type;
	}

	public void setType(TransactionType type) {
		this.type = type;
	}

	public BigDecimal getAmount() {
		return amount;
	}

	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}


	@Override
	public String toString() {
		return "Transaction [id=" + id + ", patient=" + patient + ", type=" + type + ", amount=" + amount + ", date="
				+ date + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (int) (id ^ (id >>> 32));
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Transaction other = (Transaction) obj;
		if (id != other.id)
			return false;
		return true;
	}
	
	

	
	

	
	
	
	
	
}
