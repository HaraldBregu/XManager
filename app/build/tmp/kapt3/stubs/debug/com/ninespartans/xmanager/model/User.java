package com.ninespartans.xmanager.model;

import java.lang.System;

@kotlin.Metadata(mv = {1, 1, 15}, bv = {1, 0, 3}, k = 1, d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u001f\b\u0016\u0018\u00002\u00020\u0001Bk\u0012\b\b\u0002\u0010\u0002\u001a\u00020\u0003\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\b\b\u0002\u0010\u0006\u001a\u00020\u0007\u0012\b\b\u0002\u0010\b\u001a\u00020\u0007\u0012\b\b\u0002\u0010\t\u001a\u00020\u0007\u0012\b\b\u0002\u0010\n\u001a\u00020\u0007\u0012\b\b\u0002\u0010\u000b\u001a\u00020\u0007\u0012\b\b\u0002\u0010\f\u001a\u00020\u0007\u0012\b\b\u0002\u0010\r\u001a\u00020\u000e\u0012\b\b\u0002\u0010\u000f\u001a\u00020\u000e\u00a2\u0006\u0002\u0010\u0010R\u001e\u0010\u0002\u001a\u00020\u00038\u0006@\u0006X\u0087\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b\u0011\u0010\u0012\"\u0004\b\u0013\u0010\u0014R\u001c\u0010\u0004\u001a\u0004\u0018\u00010\u0005X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b\u0015\u0010\u0016\"\u0004\b\u0017\u0010\u0018R\u001a\u0010\n\u001a\u00020\u0007X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b\u0019\u0010\u001a\"\u0004\b\u001b\u0010\u001cR\u001a\u0010\r\u001a\u00020\u000eX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b\u001d\u0010\u001e\"\u0004\b\u001f\u0010 R\u001a\u0010\u000b\u001a\u00020\u0007X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b!\u0010\u001a\"\u0004\b\"\u0010\u001cR\u001a\u0010\u0006\u001a\u00020\u0007X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b#\u0010\u001a\"\u0004\b$\u0010\u001cR\u001a\u0010\b\u001a\u00020\u0007X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b%\u0010\u001a\"\u0004\b&\u0010\u001cR\u001a\u0010\f\u001a\u00020\u0007X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b\'\u0010\u001a\"\u0004\b(\u0010\u001cR\u001a\u0010\t\u001a\u00020\u0007X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b)\u0010\u001a\"\u0004\b*\u0010\u001cR\u001a\u0010\u000f\u001a\u00020\u000eX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b+\u0010\u001e\"\u0004\b,\u0010 \u00a8\u0006-"}, d2 = {"Lcom/ninespartans/xmanager/model/User;", "Lio/realm/RealmObject;", "_id", "Lorg/bson/types/ObjectId;", "account", "Lcom/ninespartans/xmanager/model/Account;", "fullname", "", "headline", "role", "age", "emailAddress", "phoneNumber", "createdAt", "Ljava/util/Date;", "updatedAt", "(Lorg/bson/types/ObjectId;Lcom/ninespartans/xmanager/model/Account;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Date;Ljava/util/Date;)V", "get_id", "()Lorg/bson/types/ObjectId;", "set_id", "(Lorg/bson/types/ObjectId;)V", "getAccount", "()Lcom/ninespartans/xmanager/model/Account;", "setAccount", "(Lcom/ninespartans/xmanager/model/Account;)V", "getAge", "()Ljava/lang/String;", "setAge", "(Ljava/lang/String;)V", "getCreatedAt", "()Ljava/util/Date;", "setCreatedAt", "(Ljava/util/Date;)V", "getEmailAddress", "setEmailAddress", "getFullname", "setFullname", "getHeadline", "setHeadline", "getPhoneNumber", "setPhoneNumber", "getRole", "setRole", "getUpdatedAt", "setUpdatedAt", "app_debug"})
public class User extends io.realm.RealmObject {
    @org.jetbrains.annotations.NotNull()
    @io.realm.annotations.PrimaryKey()
    private org.bson.types.ObjectId _id;
    @org.jetbrains.annotations.Nullable()
    private com.ninespartans.xmanager.model.Account account;
    @org.jetbrains.annotations.NotNull()
    private java.lang.String fullname;
    @org.jetbrains.annotations.NotNull()
    private java.lang.String headline;
    @org.jetbrains.annotations.NotNull()
    private java.lang.String role;
    @org.jetbrains.annotations.NotNull()
    private java.lang.String age;
    @org.jetbrains.annotations.NotNull()
    private java.lang.String emailAddress;
    @org.jetbrains.annotations.NotNull()
    private java.lang.String phoneNumber;
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
    public final com.ninespartans.xmanager.model.Account getAccount() {
        return null;
    }
    
    public final void setAccount(@org.jetbrains.annotations.Nullable()
    com.ninespartans.xmanager.model.Account p0) {
    }
    
    @org.jetbrains.annotations.NotNull()
    public final java.lang.String getFullname() {
        return null;
    }
    
    public final void setFullname(@org.jetbrains.annotations.NotNull()
    java.lang.String p0) {
    }
    
    @org.jetbrains.annotations.NotNull()
    public final java.lang.String getHeadline() {
        return null;
    }
    
    public final void setHeadline(@org.jetbrains.annotations.NotNull()
    java.lang.String p0) {
    }
    
    @org.jetbrains.annotations.NotNull()
    public final java.lang.String getRole() {
        return null;
    }
    
    public final void setRole(@org.jetbrains.annotations.NotNull()
    java.lang.String p0) {
    }
    
    @org.jetbrains.annotations.NotNull()
    public final java.lang.String getAge() {
        return null;
    }
    
    public final void setAge(@org.jetbrains.annotations.NotNull()
    java.lang.String p0) {
    }
    
    @org.jetbrains.annotations.NotNull()
    public final java.lang.String getEmailAddress() {
        return null;
    }
    
    public final void setEmailAddress(@org.jetbrains.annotations.NotNull()
    java.lang.String p0) {
    }
    
    @org.jetbrains.annotations.NotNull()
    public final java.lang.String getPhoneNumber() {
        return null;
    }
    
    public final void setPhoneNumber(@org.jetbrains.annotations.NotNull()
    java.lang.String p0) {
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
    
    public User(@org.jetbrains.annotations.NotNull()
    org.bson.types.ObjectId _id, @org.jetbrains.annotations.Nullable()
    com.ninespartans.xmanager.model.Account account, @org.jetbrains.annotations.NotNull()
    java.lang.String fullname, @org.jetbrains.annotations.NotNull()
    java.lang.String headline, @org.jetbrains.annotations.NotNull()
    java.lang.String role, @org.jetbrains.annotations.NotNull()
    java.lang.String age, @org.jetbrains.annotations.NotNull()
    java.lang.String emailAddress, @org.jetbrains.annotations.NotNull()
    java.lang.String phoneNumber, @org.jetbrains.annotations.NotNull()
    java.util.Date createdAt, @org.jetbrains.annotations.NotNull()
    java.util.Date updatedAt) {
        super();
    }
    
    public User() {
        super();
    }
}