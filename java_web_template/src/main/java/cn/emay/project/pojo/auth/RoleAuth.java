package cn.emay.project.pojo.auth;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 角色-权限
 * 
 * @author 东旭
 *
 */
@Entity
@Table(name = "auth_role_auth")
public class RoleAuth implements Serializable {

    private static final long serialVersionUID = 1L;

    public final static String AUTH_TYPE_PAGE = "PAGE";// 页面权限
    public final static String AUTH_TYPE_OPER = "OPER";// 操作权限

    /**
     * ID
     */
    private Long id;

    /**
     * 角色ID
     */
    private Long roleId;

    /**
     * 权限ID
     */
    private Long authId;

    /**
     * 权限类型
     */
    private String type;

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Long getId() {
	return id;
    }

    public void setId(Long id) {
	this.id = id;
    }

    @Column(name = "role_id")
    public Long getRoleId() {
	return roleId;
    }

    public void setRoleId(Long roleId) {
	this.roleId = roleId;
    }

    @Column(name = "auth_id")
    public Long getAuthId() {
	return authId;
    }

    public void setAuthId(Long authId) {
	this.authId = authId;
    }

    @Column(name = "type")
    public String getType() {
	return type;
    }

    public void setType(String type) {
	this.type = type;
    }

}
