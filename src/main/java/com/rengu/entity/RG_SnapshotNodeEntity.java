package com.rengu.entity;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * 快照管理树形节点
 * Created by wey580231 on 2017/6/16.
 */
public class RG_SnapshotNodeEntity {

    private String id;                      //UUID
    private String name;                    //节点名称

    private Boolean apply;                  //是否下发mes,当bottm下发之后，将其父节点(middle节点)状态更新为true，防止重复下发
    private String level;                   //节点层级(top、middle、bottom)

    @JsonIdentityInfo(generator = ObjectIdGenerators.IntSequenceGenerator.class, property = "childsSnapshotId")
    private Set<RG_SnapshotNodeEntity> childs = new HashSet<RG_SnapshotNodeEntity>();      //子节点
    //    @JsonIdentityInfo(generator = ObjectIdGenerators.IntSequenceGenerator.class, property = "parentSnapshotId")
    private RG_SnapshotNodeEntity parent;                              //父节点
    //    @JsonIdentityInfo(generator = ObjectIdGenerators.IntSequenceGenerator.class, property = "rootSnapshotId")
    private RG_SnapshotNodeEntity rootParent;                          //根节点
    //    @JsonIdentityInfo(generator = ObjectIdGenerators.IntSequenceGenerator.class, property = "ScheduleId")
    @JsonIgnore
    private RG_ScheduleEntity schedule;                                //排程记录
    @JsonIgnore
    private List<RG_PlanEntity> plans = new ArrayList<RG_PlanEntity>();               //计划表

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Boolean getApply() {
        return apply;
    }

    public void setApply(Boolean apply) {
        this.apply = apply;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public Set<RG_SnapshotNodeEntity> getChilds() {
        return childs;
    }

    public void setChilds(Set<RG_SnapshotNodeEntity> childs) {
        this.childs = childs;
    }

    public RG_SnapshotNodeEntity getParent() {
        return parent;
    }

    public void setParent(RG_SnapshotNodeEntity parent) {
        this.parent = parent;
    }

    public RG_SnapshotNodeEntity getRootParent() {
        return rootParent;
    }

    public void setRootParent(RG_SnapshotNodeEntity rootParent) {
        this.rootParent = rootParent;
    }

    public RG_ScheduleEntity getSchedule() {
        return schedule;
    }

    public void setSchedule(RG_ScheduleEntity schedule) {
        this.schedule = schedule;
    }

    public List<RG_PlanEntity> getPlans() {
        return plans;
    }

    public void setPlans(List<RG_PlanEntity> plans) {
        this.plans = plans;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        RG_SnapshotNodeEntity that = (RG_SnapshotNodeEntity) o;

        if (id != null ? !id.equals(that.id) : that.id != null) return false;
        if (name != null ? !name.equals(that.name) : that.name != null) return false;
        if (apply != null ? !apply.equals(that.apply) : that.apply != null) return false;
        return level != null ? level.equals(that.level) : that.level == null;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (apply != null ? apply.hashCode() : 0);
        result = 31 * result + (level != null ? level.hashCode() : 0);
        return result;
    }
}
