package cn.emay.project.pojo.auth;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 操作权限
 * 
 * @author 东旭
 *
 */
@Entity
@Table(name = "auth_oper")
public class AuthOper implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * ID
     */
    private Long id;

    /**
     * 操作名称
     */
    private String name;

    /**
     * 操作顺序
     */
    private Integer index;

    /**
     * 权限CODE
     */
    private String authCode;

    /**
     * 所属页面权限ID
     */
    private Long pageAuthId;

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Long getId() {
	return id;
    }

    public void setId(Long id) {
	this.id = id;
    }

    @Column(name = "name")
    public String getName() {
	return name;
    }

    public void setName(String name) {
	this.name = name;
    }

    @Column(name = "l_index")
    public Integer getIndex() {
	return index;
    }

    public void setIndex(Integer index) {
	this.index = index;
    }

    @Column(name = "auth_code")
    public String getAuthCode() {
	return authCode;
    }

    public void setAuthCode(String authCode) {
	this.authCode = authCode;
    }

    @Column(name = "page_auth_id")
    public Long getPageAuthId() {
	return pageAuthId;
    }

    public void setPageAuthId(Long pageAuthId) {
	this.pageAuthId = pageAuthId;
    }

}
