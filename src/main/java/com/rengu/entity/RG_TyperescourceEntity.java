package com.rengu.entity;

import java.util.Set;

/**
 * Created by wey580231 on 2017/5/23.
 */
public class RG_TyperescourceEntity {
    private String id;
    private String name;
    private String attribute;
    private Double ratio;
    private Set<RG_ResourceEntity> resources;

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

    public String getAttribute() {
        return attribute;
    }

    public void setAttribute(String attribute) {
        this.attribute = attribute;
    }

    public Double getRatio() {
        return ratio;
    }

    public void setRatio(Double ratio) {
        this.ratio = ratio;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        RG_TyperescourceEntity that = (RG_TyperescourceEntity) o;

        if (id != null ? !id.equals(that.id) : that.id != null) return false;
        if (name != null ? !name.equals(that.name) : that.name != null) return false;
        if (attribute != null ? !attribute.equals(that.attribute) : that.attribute != null) return false;
        if (ratio != null ? !ratio.equals(that.ratio) : that.ratio != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (attribute != null ? attribute.hashCode() : 0);
        result = 31 * result + (ratio != null ? ratio.hashCode() : 0);
        return result;
    }

    public Set<RG_ResourceEntity> getResources() {
        return resources;
    }

    public void setResources(Set<RG_ResourceEntity> resources) {
        this.resources = resources;
    }
}