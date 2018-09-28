package cn.dissing.board.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.List;

/**
 * Created by lilongyun on 2018/4/30.
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
public class PostInfo {
    private Integer id;

    private Integer ownerId;

    private Integer typeId;

    private String subject;

    private String content;

    @JsonFormat(timezone = "GTM+8")
    @DateTimeFormat
    private Date createTime;

    private Date updateTime;

    private Boolean isDeleted;

    private int beginPos = 0;

    private int pageSize = 10;
}
