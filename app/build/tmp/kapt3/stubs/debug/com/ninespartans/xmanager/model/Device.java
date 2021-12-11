package com.ninespartans.xmanager.model;

import java.lang.System;

@kotlin.Metadata(mv = {1, 1, 15}, bv = {1, 0, 3}, k = 1, d1 = {"\u00000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b!\b\u0016\u0018\u00002\u00020\u0001Bq\u0012\b\b\u0002\u0010\u0002\u001a\u00020\u0003\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\b\b\u0002\u0010\u0006\u001a\u00020\u0007\u0012\b\b\u0002\u0010\b\u001a\u00020\u0007\u0012\b\b\u0002\u0010\t\u001a\u00020\u0007\u0012\b\b\u0002\u0010\n\u001a\u00020\u0007\u0012\b\b\u0002\u0010\u000b\u001a\u00020\u0007\u0012\u000e\b\u0002\u0010\f\u001a\b\u0012\u0004\u0012\u00020\u000e0\r\u0012\b\b\u0002\u0010\u000f\u001a\u00020\u0010\u0012\b\b\u0002\u0010\u0011\u001a\u00020\u0010\u00a2\u0006\u0002\u0010\u0012R\u001e\u0010\u0002\u001a\u00020\u00038\u0006@\u0006X\u0087\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b\u0013\u0010\u0014\"\u0004\b\u0015\u0010\u0016R\u001a\u0010\n\u001a\u00020\u0007X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b\u0017\u0010\u0018\"\u0004\b\u0019\u0010\u001aR\u001a\u0010\u000f\u001a\u00020\u0010X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b\u001b\u0010\u001c\"\u0004\b\u001d\u0010\u001eR\u001a\u0010\b\u001a\u00020\u0007X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b\u001f\u0010\u0018\"\u0004\b \u0010\u001aR\u001a\u0010\t\u001a\u00020\u0007X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b!\u0010\u0018\"\u0004\b\"\u0010\u001aR\u001a\u0010\u0006\u001a\u00020\u0007X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b#\u0010\u0018\"\u0004\b$\u0010\u001aR \u0010\f\u001a\b\u0012\u0004\u0012\u00020\u000e0\rX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b%\u0010&\"\u0004\b\'\u0010(R\u001a\u0010\u0011\u001a\u00020\u0010X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b)\u0010\u001c\"\u0004\b*\u0010\u001eR\u001c\u0010\u0004\u001a\u0004\u0018\u00010\u0005X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b+\u0010,\"\u0004\b-\u0010.R\u001a\u0010\u000b\u001a\u00020\u0007X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b/\u0010\u0018\"\u0004\b0\u0010\u001a\u00a8\u00061"}, d2 = {"Lcom/ninespartans/xmanager/model/Device;", "Lio/realm/RealmObject;", "_id", "Lorg/bson/types/ObjectId;", "user", "Lcom/ninespartans/xmanager/model/User;", "name", "", "firmwareVersion", "mac", "ble_mac", "wifi_mac", "programs", "Lio/realm/RealmList;", "Lcom/ninespartans/xmanager/model/Program;", "createdAt", "Ljava/util/Date;", "updatedAt", "(Lorg/bson/types/ObjectId;Lcom/ninespartans/xmanager/model/User;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lio/realm/RealmList;Ljava/util/Date;Ljava/util/Date;)V", "get_id", "()Lorg/bson/types/ObjectId;", "set_id", "(Lorg/bson/types/ObjectId;)V", "getBle_mac", "()Ljava/lang/String;", "setBle_mac", "(Ljava/lang/String;)V", "getCreatedAt", "()Ljava/util/Date;", "setCreatedAt", "(Ljava/util/Date;)V", "getFirmwareVersion", "setFirmwareVersion", "getMac", "setMac", "getName", "setName", "getPrograms", "()Lio/realm/RealmList;", "setPrograms", "(Lio/realm/RealmList;)V", "getUpdatedAt", "setUpdatedAt", "getUser", "()Lcom/ninespartans/xmanager/model/User;", "setUser", "(Lcom/ninespartans/xmanager/model/User;)V", "getWifi_mac", "setWifi_mac", "app_debug"})
public class Device extends io.realm.RealmObject {
    @org.jetbrains.annotations.NotNull()
    @io.realm.annotations.PrimaryKey()
    private org.bson.types.ObjectId _id;
    @org.jetbrains.annotations.Nullable()
    private com.ninespartans.xmanager.model.User user;
    @org.jetbrains.annotations.NotNull()
    private java.lang.String name;
    @org.jetbrains.annotations.NotNull()
    private java.lang.String firmwareVersion;
    @org.jetbrains.annotations.NotNull()
    private java.lang.String mac;
    @org.jetbrains.annotations.NotNull()
    private java.lang.String ble_mac;
    @org.jetbrains.annotations.NotNull()
    private java.lang.String wifi_mac;
    @org.jetbrains.annotations.NotNull()
    private io.realm.RealmList<com.ninespartans.xmanager.model.Program> programs;
    @org.jetbrains.annotations.NotNull()
    private java.util.Date createdAt;
    @org.jetbrains.annotations.NotNull()
    private java.util.Date updatedAt;
    
    @org.jetbrains.annotations.NotNull()
    public final org.bson.types.ObjectId get_id() {
        return null;
    }
    
    public final void set_id(@org.jetbrains.annotations.NotNull()
    org.bson.types.ObjectId p0) {
    }
    
    @org.jetbrains.annotations.Nullable()
    public final com.ninespartans.xmanager.model.User getUser() {
        return null;
    }
    
    public final void setUser(@org.jetbrains.annotations.Nullable()
    com.ninespartans.xmanager.model.User p0) {
    }
    
    @org.jetbrains.annotations.NotNull()
    public final java.lang.String getName() {
        return null;
    }
    
    public final void setName(@org.jetbrains.annotations.NotNull()
    java.lang.String p0) {
    }
    
    @org.jetbrains.annotations.NotNull()
    public final java.lang.String getFirmwareVersion() {
        return null;
    }
    
    public final void setFirmwareVersion(@org.jetbrains.annotations.NotNull()
    java.lang.String p0) {
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
    
    @org.jetbrains.annotations.NotNull()
    public final java.lang.String getWifi_mac() {
        return null;
    }
    
    public final void setWifi_mac(@org.jetbrains.annotations.NotNull()
    java.lang.String p0) {
    }
    
    @org.jetbrains.annotations.NotNull()
    public final io.realm.RealmList<com.ninespartans.xmanager.model.Program> getPrograms() {
        return null;
    }
    
    public final void setPrograms(@org.jetbrains.annotations.NotNull()
    io.realm.RealmList<com.ninespartans.xmanager.model.Program> p0) {
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
    
    public Device(@org.jetbrains.annotations.NotNull()
    org.bson.types.ObjectId _id, @org.jetbrains.annotations.Nullable()
    com.ninespartans.xmanager.model.User user, @org.jetbrains.annotations.NotNull()
    java.lang.String name, @org.jetbrains.annotations.NotNull()
    java.lang.String firmwareVersion, @org.jetbrains.annotations.NotNull()
    java.lang.String mac, @org.jetbrains.annotations.NotNull()
    java.lang.String ble_mac, @org.jetbrains.annotations.NotNull()
    java.lang.String wifi_mac, @org.jetbrains.annotations.NotNull()
    io.realm.RealmList<com.ninespartans.xmanager.model.Program> programs, @org.jetbrains.annotations.NotNull()
    java.util.Date createdAt, @org.jetbrains.annotations.NotNull()
    java.util.Date updatedAt) {
        super();
    }
    
    public Device() {
        super();
    }
}