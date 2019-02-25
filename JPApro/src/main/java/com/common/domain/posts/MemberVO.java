package com.common.domain.posts;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import lombok.Data;

@Entity
@Table(name = "ag_admin")
@Data
@Component
public class MemberVO {

	@Id
	@GeneratedValue
	private Integer idx;

	@Column
	private String email;

	@Column
	private String password;

	@Column(nullable = false)
	@Enumerated(EnumType.STRING)
	private Role role;
	
	public enum Role {
		ROLE_ADMIN /* 난 그냥 일단 하나만 만들어서 할꺼임. 공부니까 */
	}

}
