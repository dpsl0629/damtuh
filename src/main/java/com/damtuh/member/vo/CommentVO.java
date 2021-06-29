package com.damtuh.member.vo;

import java.io.Serializable;
import java.util.Date;
import org.springframework.stereotype.Component;
import lombok.Data;

@Data
@Component("CommentVO")
public class CommentVO  implements Serializable{

	private static final long serialVersionUID = 1L;
	private String deliveryNum;
	private int productNum;
	private String userId;
	private String content;
	private int likeCount;
	private Date writeDate;
	
}
