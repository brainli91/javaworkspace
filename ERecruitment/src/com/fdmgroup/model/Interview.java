package com.fdmgroup.model;

import java.sql.Date;
import java.util.Comparator;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

/**
 * @author jacky, Sammy
 *
 */
@Entity
@Table(name = "ER_INTERVIEWS")
@NamedQueries({ @NamedQuery(name = "interview.findAll", query = "SELECT i FROM Interview i"),
    @NamedQuery(name = "interview.findInterviewsByResult", query = "SELECT i from Interview i where i.result = :InterviewResult "),
    @NamedQuery(name = "interview.findInterviewsByType", query = "SELECT i from Interview i where i.type = :InterviewType "),
	@NamedQuery(name = "interview.findCurrentInterviews", query = "SELECT i from Interview i where i.date > CURRENT_DATE ") })

public class Interview implements IStorable {

  @Id
  @Column(name = "interview_id")
  @SequenceGenerator(name = "er_interview_sequence", sequenceName = "ER_INTERVIEW_SEQ", allocationSize = 1)
  @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "er_interview_sequence")
  private long id;

  @Column(name = "result") // enum: Pass, fail, in_progress, cancelled, pending
  private InterviewResult result;

  @Column(name = "type") // enum: phone, in_person, assessment
  private InterviewType type;
  //
  @Column(name = "interview_date")
  private Date date;

  @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
  @JoinColumn(name = "job_app_id")
  private JobApplication jobApplication;


  public Interview() {
    this(null, null);
  }

  public Interview(InterviewType type, Date date) {
    super();
    this.result = InterviewResult.PENDING;
    this.type = type;
    this.date = date;
    this.jobApplication = null;
  }

  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }

  public InterviewResult getResult() {
    return result;
  }

  public void setResult(InterviewResult result) {
    this.result = result;
  }

  public InterviewType getType() {
    return type;
  }

  public void setType(InterviewType type) {
    this.type = type;
  }

  public Date getDate() {
    return date;
  }

  public void setDate(Date date) {
    this.date = date;
  }

  public JobApplication getJobApplication() {
    return jobApplication;
  }

  public void setJobApplication(JobApplication jobApplication) {
    this.jobApplication = jobApplication;
  }

  @Override
  public boolean equals(Object obj) {
    if (this == obj)
      return true;
    if (obj == null)
      return false;
    if (getClass() != obj.getClass())
      return false;
    Interview other = (Interview) obj;
    if (id != other.id)
      return false;
    return true;
  }

  @Override
  public int hashCode() {
    final int prime = 31;
    int result = 1;
    result = prime * result + (int) (id ^ (id >>> 32));
    return result;
  }

  @Override
  public String toString() {
    return "Interview [id=" + id + ", result=" + result + ", type=" + type + ", date=" + date + "]";
  }

  public static Comparator<Interview> sortByDate = new Comparator<Interview>() {
    @Override
    public int compare(Interview i1, Interview i2) {
      return Long.compare(i1.getDate().getTime(), i2.getDate().getTime());
    }
  };

}