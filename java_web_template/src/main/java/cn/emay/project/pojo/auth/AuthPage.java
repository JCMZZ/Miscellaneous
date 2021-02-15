package cn.emay.project.pojo.auth;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 页面权限
 * 
 * @author 东旭
 *
 */
@Entity
@Table(name = "auth_page")
public class AuthPage implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * ID
     */
    private Long id;

    /**
     * 页面名称
     */
    private String name;

    /**
     * 页面顺序
     */
    private Integer index;

    /**
     * 权限CODE
     */
    private String authCode;

    /**
     * 页面URL
     */
    private String pageUrl;

    /**
     * 所属导航ID
     */
    private Long navigationId;

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

    @Column(name = "page_url")
    public String getPageUrl() {
	return pageUrl;
    }

    public void setPageUrl(String pageUrl) {
	this.pageUrl = pageUrl;
    }

    @Column(name = "navigation_id")
    public Long getNavigationId() {
	return navigationId;
    }

    public void setNavigationId(Long navigationId) {
	this.navigationId = navigationId;
    }

}
