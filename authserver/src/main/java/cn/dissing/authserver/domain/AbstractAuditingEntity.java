package cn.dissing.authserver.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
public abstract class AbstractAuditingEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @JsonIgnore
    private String createdBy;

    @JsonIgnore
    private Date createdDate;

    @JsonIgnore
    private String lastModifiedBy;

    @JsonIgnore
    private Date lastModifiedDate;


}
