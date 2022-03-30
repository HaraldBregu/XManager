package com.ninespartans.xmanager.model;

import java.lang.System;

@kotlin.Metadata(mv = {1, 5, 1}, k = 1, d1 = {"\u0000<\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0013\n\u0002\u0018\u0002\n\u0002\b\u0019\b\u0016\u0018\u00002\u00020\u0001:\u0001=Bw\u0012\b\b\u0002\u0010\u0002\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u0004\u001a\u00020\u0005\u0012\b\b\u0002\u0010\u0006\u001a\u00020\u0005\u0012\b\b\u0002\u0010\u0007\u001a\u00020\u0005\u0012\b\b\u0002\u0010\b\u001a\u00020\t\u0012\b\b\u0002\u0010\n\u001a\u00020\u0005\u0012\b\b\u0002\u0010\u000b\u001a\u00020\u0005\u0012\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\r\u0012\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\u000f\u0012\b\b\u0002\u0010\u0010\u001a\u00020\u0011\u0012\b\b\u0002\u0010\u0012\u001a\u00020\u0011\u00a2\u0006\u0002\u0010\u0013R\u001e\u0010\u0002\u001a\u00020\u00038\u0006@\u0006X\u0087\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b\u0014\u0010\u0015\"\u0004\b\u0016\u0010\u0017R\u001a\u0010\b\u001a\u00020\tX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b\u0018\u0010\u0019\"\u0004\b\u001a\u0010\u001bR\u001a\u0010\u000b\u001a\u00020\u0005X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b\u001c\u0010\u001d\"\u0004\b\u001e\u0010\u001fR\u001a\u0010\u0010\u001a\u00020\u0011X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b \u0010!\"\u0004\b\"\u0010#R$\u0010&\u001a\u00020%2\u0006\u0010$\u001a\u00020%8F@FX\u0086\u000e\u00a2\u0006\f\u001a\u0004\b\'\u0010(\"\u0004\b)\u0010*R\u001a\u0010\n\u001a\u00020\u0005X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b+\u0010\u001d\"\u0004\b,\u0010\u001fR\u001a\u0010\u0004\u001a\u00020\u0005X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b-\u0010\u001d\"\u0004\b.\u0010\u001fR\u001c\u0010\f\u001a\u0004\u0018\u00010\rX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b/\u00100\"\u0004\b1\u00102R\u001a\u0010\u0007\u001a\u00020\u0005X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b3\u0010\u001d\"\u0004\b4\u0010\u001fR\u001a\u0010\u0012\u001a\u00020\u0011X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b5\u0010!\"\u0004\b6\u0010#R\u001c\u0010\u000e\u001a\u0004\u0018\u00010\u000fX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b7\u00108\"\u0004\b9\u0010:R\u001a\u0010\u0006\u001a\u00020\u0005X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b;\u0010\u001d\"\u0004\b<\u0010\u001f\u00a8\u0006>"}, d2 = {"Lcom/ninespartans/xmanager/model/Device;", "Lio/realm/RealmObject;", "_id", "Lorg/bson/types/ObjectId;", "name", "", "version", "type", "active", "", "mac", "ble_mac", "program", "Lcom/ninespartans/xmanager/model/DeviceProgram;", "user", "Lcom/ninespartans/xmanager/model/User;", "createdAt", "Ljava/util/Date;", "updatedAt", "(Lorg/bson/types/ObjectId;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Lcom/ninespartans/xmanager/model/DeviceProgram;Lcom/ninespartans/xmanager/model/User;Ljava/util/Date;Ljava/util/Date;)V", "get_id", "()Lorg/bson/types/ObjectId;", "set_id", "(Lorg/bson/types/ObjectId;)V", "getActive", "()Z", "setActive", "(Z)V", "getBle_mac", "()Ljava/lang/String;", "setBle_mac", "(Ljava/lang/String;)V", "getCreatedAt", "()Ljava/util/Date;", "setCreatedAt", "(Ljava/util/Date;)V", "newEnumType", "Lcom/ninespartans/xmanager/model/Device$DeviceType;", "deviceType", "getDeviceType", "()Lcom/ninespartans/xmanager/model/Device$DeviceType;", "setDeviceType", "(Lcom/ninespartans/xmanager/model/Device$DeviceType;)V", "getMac", "setMac", "getName", "setName", "getProgram", "()Lcom/ninespartans/xmanager/model/DeviceProgram;", "setProgram", "(Lcom/ninespartans/xmanager/model/DeviceProgram;)V", "getType", "setType", "getUpdatedAt", "setUpdatedAt", "getUser", "()Lcom/ninespartans/xmanager/model/User;", "setUser", "(Lcom/ninespartans/xmanager/model/User;)V", "getVersion", "setVersion", "DeviceType", "app_debug"})
public class Device extends io.realm.RealmObject {
    @org.jetbrains.annotations.NotNull()
    @io.realm.annotations.PrimaryKey()
    private org.bson.types.ObjectId _id;
    @org.jetbrains.annotations.NotNull()
    private java.lang.String name;
    @org.jetbrains.annotations.NotNull()
    private java.lang.String version;
    @org.jetbrains.annotations.NotNull()
    private java.lang.String type;
    private boolean active;
    @org.jetbrains.annotations.NotNull()
    private java.lang.String mac;
    @org.jetbrains.annotations.NotNull()
    private java.lang.String ble_mac;
    @org.jetbrains.annotations.Nullable()
    private com.ninespartans.xmanager.model.DeviceProgram program;
    @org.jetbrains.annotations.Nullable()
    private com.ninespartans.xmanager.model.User user;
    @org.jetbrains.annotations.NotNull()
    private java.util.Date createdAt;
    @org.jetbrains.annotations.NotNull()
    private java.util.Date updatedAt;
    
    public Device() {
        super();
    }
    
    public Device(@org.jetbrains.annotations.NotNull()
    org.bson.types.ObjectId _id, @org.jetbrains.annotations.NotNull()
    java.lang.String name, @org.jetbrains.annotations.NotNull()
    java.lang.String version, @org.jetbrains.annotations.NotNull()
    java.lang.String type, boolean active, @org.jetbrains.annotations.NotNull()
    java.lang.String mac, @org.jetbrains.annotations.NotNull()
    java.lang.String ble_mac, @org.jetbrains.annotations.Nullable()
    com.ninespartans.xmanager.model.DeviceProgram program, @org.jetbrains.annotations.Nullable()
    com.ninespartans.xmanager.model.User user, @org.jetbrains.annotations.NotNull()
    java.util.Date createdAt, @org.jetbrains.annotations.NotNull()
    java.util.Date updatedAt) {
        super();
    }
    
    @org.jetbrains.annotations.NotNull()
    public final org.bson.types.ObjectId get_id() {
        return null;
    }
    
    public final void set_id(@org.jetbrains.annotations.NotNull()
    org.bson.types.ObjectId p0) {
    }
    
    @org.jetbrains.annotations.NotNull()
    public final java.lang.String getName() {
        return null;
    }
    
    public final void setName(@org.jetbrains.annotations.NotNull()
    java.lang.String p0) {
    }
    
    @org.jetbrains.annotations.NotNull()
    public final java.lang.String getVersion() {
        return null;
    }
    
    public final void setVersion(@org.jetbrains.annotations.NotNull()
    java.lang.String p0) {
    }
    
    @org.jetbrains.annotations.NotNull()
    public final java.lang.String getType() {
        return null;
    }
    
    public final void setType(@org.jetbrains.annotations.NotNull()
    java.lang.String p0) {
    }
    
    public final boolean getActive() {
        return false;
    }
    
    public final void setActive(boolean p0) {
    }
    
    @org.jetbrains.annotations.NotNull()
    public final java.lang.String getMac() {
        return null;
    }
    
    public final void setMac(@org.jetbrains.annotations.NotNull()
    java.lang.String p0) {
    }
    
    @org.jetbrains.annotations.NotNull()
    public final java.lang.String getBle_mac() {
        return null;
    }
    
    public final void setBle_mac(@org.jetbrains.annotations.NotNull()
    java.lang.String p0) {
    }
    
    @org.jetbrains.annotations.Nullable()
    public final com.ninespartans.xmanager.model.DeviceProgram getProgram() {
        return null;
    }
    
    public final void setProgram(@org.jetbrains.annotations.Nullable()
    com.ninespartans.xmanager.model.DeviceProgram p0) {
    }
    
    @org.jetbrains.annotations.Nullable()
    public final com.ninespartans.xmanager.model.User getUser() {
        return null;
    }
    
    public final void setUser(@org.jetbrains.annotations.Nullable()
    com.ninespartans.xmanager.model.User p0) {
    }
    
    @org.jetbrains.annotations.NotNull()
    public final java.util.Date getCreatedAt() {
        return null;
    }
    
    public final void setCreatedAt(@org.jetbrains.annotations.NotNull()
    java.util.Date p0) {
    }
    
    @org.jetbrains.annotations.NotNull()
    public final java.util.Date getUpdatedAt() {
        return null;
    }
    
    public final void setUpdatedAt(@org.jetbrains.annotations.NotNull()
    java.util.Date p0) {
    }
    
    @org.jetbrains.annotations.NotNull()
    public final com.ninespartans.xmanager.model.Device.DeviceType getDeviceType() {
        return null;
    }
    
    public final void setDeviceType(@org.jetbrains.annotations.NotNull()
    com.ninespartans.xmanager.model.Device.DeviceType newEnumType) {
    }
    
    /**
     * Type of device
     */
    @kotlin.Metadata(mv = {1, 5, 1}, k = 1, d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\b\u0005\b\u0086\u0001\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001B\u0007\b\u0002\u00a2\u0006\u0002\u0010\u0002j\u0002\b\u0003j\u0002\b\u0004j\u0002\b\u0005\u00a8\u0006\u0006"}, d2 = {"Lcom/ninespartans/xmanager/model/Device$DeviceType;", "", "(Ljava/lang/String;I)V", "NONE", "SHOE_LEFT", "SHOE_RIGHT", "app_debug"})
    public static enum DeviceType {
        /*public static final*/ NONE /* = new NONE() */,
        /*public static final*/ SHOE_LEFT /* = new SHOE_LEFT() */,
        /*public static final*/ SHOE_RIGHT /* = new SHOE_RIGHT() */;
        
        DeviceType() {
        }
    }
}