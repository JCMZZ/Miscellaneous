package cn.emay.project.pojo.user;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * 用户
 * 
 * @author 东旭
 *
 */
@Entity
@Table(name = "emay_user")
public class User implements Serializable {

	private static final long serialVersionUID = 1L;

	public final static int STATE_ON = 2;// 启用
	public final static int STATE_OFF = 1;// 停用
	public final static int STATE_DELETE = 0;// 删除

	/**
	 * id
	 */
	private Long id;

	/**
	 * 姓名
	 */
	private String nickname;

	/**
	 * 用户名
	 */
	private String username;

	/**
	 * 登录密码
	 */
	private String password;

	/**
	 * 邮箱
	 */
	private String email;

	/**
	 * 手机
	 */
	private String mobile;

	/**
	 * 状态
	 */
	private Integer state;

	/**
	 * 创建时间
	 */
	private Date createTime;

	/**
	 * 创建者Id
	 */
	private Long creatorUserId;

	public User(String nickname, String username, String password, String email, String mobile, Long creatorUserId) {
		this.nickname = nickname;
		this.username = username;
		this.password = password;
		this.email = email;
		this.mobile = mobile;
		this.creatorUserId = creatorUserId;
		this.createTime = new Date();
		this.state = STATE_ON;
	}

	public User() {

	}

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@Column(name = "nickname")
	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	@Column(name = "username")
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Column(name = "password")
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name = "email")
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "mobile")
	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	@Column(name = "user_state")
	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	@Column(name = "create_time")
	@Temporal(TemporalType.TIMESTAMP)
	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	@Column(name = "create_user_id")
	public Long getCreatorUserId() {
		return creatorUserId;
	}

	public void setCreatorUserId(Long creatorUserId) {
		this.creatorUserId = creatorUserId;
	}

}
