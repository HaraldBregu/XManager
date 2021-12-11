package com.ninespartans.xmanager.model;

import java.lang.System;

@kotlin.Metadata(mv = {1, 1, 15}, bv = {1, 0, 3}, k = 1, d1 = {"\u0000@\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u001c\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0010\u0012\n\u0000\b\u0016\u0018\u00002\u00020\u0001Ba\u0012\b\b\u0002\u0010\u0002\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u0004\u001a\u00020\u0005\u0012\b\b\u0002\u0010\u0006\u001a\u00020\u0005\u0012\u000e\b\u0002\u0010\u0007\u001a\b\u0012\u0004\u0012\u00020\t0\b\u0012\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u000b\u0012\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u000b\u0012\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\u000b\u0012\b\b\u0002\u0010\u000e\u001a\u00020\u000f\u00a2\u0006\u0002\u0010\u0010J\u0006\u0010+\u001a\u00020,J\u0006\u0010-\u001a\u00020,J\u0006\u0010.\u001a\u00020,J\u0006\u0010/\u001a\u000200R\u001e\u0010\u0002\u001a\u00020\u00038\u0006@\u0006X\u0087\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b\u0011\u0010\u0012\"\u0004\b\u0013\u0010\u0014R\u001a\u0010\u000e\u001a\u00020\u000fX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b\u0015\u0010\u0016\"\u0004\b\u0017\u0010\u0018R\u001c\u0010\n\u001a\u0004\u0018\u00010\u000bX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b\u0019\u0010\u001a\"\u0004\b\u001b\u0010\u001cR\u001a\u0010\u0006\u001a\u00020\u0005X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b\u001d\u0010\u001e\"\u0004\b\u001f\u0010 R \u0010\u0007\u001a\b\u0012\u0004\u0012\u00020\t0\bX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b!\u0010\"\"\u0004\b#\u0010$R\u001c\u0010\r\u001a\u0004\u0018\u00010\u000bX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b%\u0010\u001a\"\u0004\b&\u0010\u001cR\u001a\u0010\u0004\u001a\u00020\u0005X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b\'\u0010\u001e\"\u0004\b(\u0010 R\u001c\u0010\f\u001a\u0004\u0018\u00010\u000bX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b)\u0010\u001a\"\u0004\b*\u0010\u001c\u00a8\u00061"}, d2 = {"Lcom/ninespartans/xmanager/model/TrainingProgram;", "Lio/realm/RealmObject;", "_id", "Lorg/bson/types/ObjectId;", "title", "", "description", "programs", "Lio/realm/RealmList;", "Lcom/ninespartans/xmanager/model/Program;", "createdAt", "Ljava/util/Date;", "updatedAt", "startDate", "active", "", "(Lorg/bson/types/ObjectId;Ljava/lang/String;Ljava/lang/String;Lio/realm/RealmList;Ljava/util/Date;Ljava/util/Date;Ljava/util/Date;Z)V", "get_id", "()Lorg/bson/types/ObjectId;", "set_id", "(Lorg/bson/types/ObjectId;)V", "getActive", "()Z", "setActive", "(Z)V", "getCreatedAt", "()Ljava/util/Date;", "setCreatedAt", "(Ljava/util/Date;)V", "getDescription", "()Ljava/lang/String;", "setDescription", "(Ljava/lang/String;)V", "getPrograms", "()Lio/realm/RealmList;", "setPrograms", "(Lio/realm/RealmList;)V", "getStartDate", "setStartDate", "getTitle", "setTitle", "getUpdatedAt", "setUpdatedAt", "durationHours", "", "durationMinutes", "durationSeconds", "programBytesDevice", "", "app_debug"})
public class TrainingProgram extends io.realm.RealmObject {
    @org.jetbrains.annotations.NotNull()
    @io.realm.annotations.PrimaryKey()
    private org.bson.types.ObjectId _id;
    @org.jetbrains.annotations.NotNull()
    private java.lang.String title;
    @org.jetbrains.annotations.NotNull()
    private java.lang.String description;
    @org.jetbrains.annotations.NotNull()
    private io.realm.RealmList<com.ninespartans.xmanager.model.Program> programs;
    @org.jetbrains.annotations.Nullable()
    private java.util.Date createdAt;
    @org.jetbrains.annotations.Nullable()
    private java.util.Date updatedAt;
    @org.jetbrains.annotations.Nullable()
    private java.util.Date startDate;
    private boolean active;
    
    @org.jetbrains.annotations.NotNull()
    public final byte[] programBytesDevice() {
        return null;
    }
    
    public final int durationHours() {
        return 0;
    }
    
    public final int durationMinutes() {
        return 0;
    }
    
    public final int durationSeconds() {
        return 0;
    }
    
    @org.jetbrains.annotations.NotNull()
    public final org.bson.types.ObjectId get_id() {
        return null;
    }
    
    public final void set_id(@org.jetbrains.annotations.NotNull()
    org.bson.types.ObjectId p0) {
    }
    
    @org.jetbrains.annotations.NotNull()
    public final java.lang.String getTitle() {
        return null;
    }
    
    public final void setTitle(@org.jetbrains.annotations.NotNull()
    java.lang.String p0) {
    }
    
    @org.jetbrains.annotations.NotNull()
    public final java.lang.String getDescription() {
        return null;
    }
    
    public final void setDescription(@org.jetbrains.annotations.NotNull()
    java.lang.String p0) {
    }
    
    @org.jetbrains.annotations.NotNull()
    public final io.realm.RealmList<com.ninespartans.xmanager.model.Program> getPrograms() {
        return null;
    }
    
    public final void setPrograms(@org.jetbrains.annotations.NotNull()
    io.realm.RealmList<com.ninespartans.xmanager.model.Program> p0) {
    }
    
    @org.jetbrains.annotations.Nullable()
    public final java.util.Date getCreatedAt() {
        return null;
    }
    
    public final void setCreatedAt(@org.jetbrains.annotations.Nullable()
    java.util.Date p0) {
    }
    
    @org.jetbrains.annotations.Nullable()
    public final java.util.Date getUpdatedAt() {
        return null;
    }
    
    public final void setUpdatedAt(@org.jetbrains.annotations.Nullable()
    java.util.Date p0) {
    }
    
    @org.jetbrains.annotations.Nullable()
    public final java.util.Date getStartDate() {
        return null;
    }
    
    public final void setStartDate(@org.jetbrains.annotations.Nullable()
    java.util.Date p0) {
    }
    
    public final boolean getActive() {
        return false;
    }
    
    public final void setActive(boolean p0) {
    }
    
    public TrainingProgram(@org.jetbrains.annotations.NotNull()
    org.bson.types.ObjectId _id, @org.jetbrains.annotations.NotNull()
    java.lang.String title, @org.jetbrains.annotations.NotNull()
    java.lang.String description, @org.jetbrains.annotations.NotNull()
    io.realm.RealmList<com.ninespartans.xmanager.model.Program> programs, @org.jetbrains.annotations.Nullable()
    java.util.Date createdAt, @org.jetbrains.annotations.Nullable()
    java.util.Date updatedAt, @org.jetbrains.annotations.Nullable()
    java.util.Date startDate, boolean active) {
        super();
    }
    
    public TrainingProgram() {
        super();
    }
}