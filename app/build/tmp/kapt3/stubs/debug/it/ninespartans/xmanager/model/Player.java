package it.ninespartans.xmanager.model;

import java.lang.System;

@kotlin.Metadata(mv = {1, 1, 15}, bv = {1, 0, 3}, k = 1, d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u001a\b\u0016\u0018\u00002\u00020\u0001B[\u0012\b\b\u0002\u0010\u0002\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u0004\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u0005\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u0006\u001a\u00020\u0003\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\b\u0012\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\b\u0012\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u000b\u0012\b\b\u0002\u0010\f\u001a\u00020\r\u00a2\u0006\u0002\u0010\u000eR\u001a\u0010\f\u001a\u00020\rX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b\u000f\u0010\u0010\"\u0004\b\u0011\u0010\u0012R\u001a\u0010\u0006\u001a\u00020\u0003X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b\u0013\u0010\u0014\"\u0004\b\u0015\u0010\u0016R\u001a\u0010\u0004\u001a\u00020\u0003X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b\u0017\u0010\u0014\"\u0004\b\u0018\u0010\u0016R\u001e\u0010\u0002\u001a\u00020\u00038\u0006@\u0006X\u0087\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b\u0019\u0010\u0014\"\u0004\b\u001a\u0010\u0016R\u001c\u0010\u0007\u001a\u0004\u0018\u00010\bX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b\u001b\u0010\u001c\"\u0004\b\u001d\u0010\u001eR\u001c\u0010\t\u001a\u0004\u0018\u00010\bX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b\u001f\u0010\u001c\"\u0004\b \u0010\u001eR\u001a\u0010\u0005\u001a\u00020\u0003X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b!\u0010\u0014\"\u0004\b\"\u0010\u0016R\u001c\u0010\n\u001a\u0004\u0018\u00010\u000bX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b#\u0010$\"\u0004\b%\u0010&\u00a8\u0006\'"}, d2 = {"Lit/ninespartans/xmanager/model/Player;", "Lio/realm/RealmObject;", "id", "", "fullname", "role", "age", "leftDevice", "Lit/ninespartans/xmanager/model/Device;", "rightDevice", "sessionProgram", "Lit/ninespartans/xmanager/model/TrainingSessionProgram;", "active", "", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lit/ninespartans/xmanager/model/Device;Lit/ninespartans/xmanager/model/Device;Lit/ninespartans/xmanager/model/TrainingSessionProgram;Z)V", "getActive", "()Z", "setActive", "(Z)V", "getAge", "()Ljava/lang/String;", "setAge", "(Ljava/lang/String;)V", "getFullname", "setFullname", "getId", "setId", "getLeftDevice", "()Lit/ninespartans/xmanager/model/Device;", "setLeftDevice", "(Lit/ninespartans/xmanager/model/Device;)V", "getRightDevice", "setRightDevice", "getRole", "setRole", "getSessionProgram", "()Lit/ninespartans/xmanager/model/TrainingSessionProgram;", "setSessionProgram", "(Lit/ninespartans/xmanager/model/TrainingSessionProgram;)V", "app_debug"})
public class Player extends io.realm.RealmObject {
    @org.jetbrains.annotations.NotNull()
    @io.realm.annotations.PrimaryKey()
    private java.lang.String id;
    @org.jetbrains.annotations.NotNull()
    private java.lang.String fullname;
    @org.jetbrains.annotations.NotNull()
    private java.lang.String role;
    @org.jetbrains.annotations.NotNull()
    private java.lang.String age;
    @org.jetbrains.annotations.Nullable()
    private it.ninespartans.xmanager.model.Device leftDevice;
    @org.jetbrains.annotations.Nullable()
    private it.ninespartans.xmanager.model.Device rightDevice;
    @org.jetbrains.annotations.Nullable()
    private it.ninespartans.xmanager.model.TrainingSessionProgram sessionProgram;
    private boolean active;
    
    @org.jetbrains.annotations.NotNull()
    public final java.lang.String getId() {
        return null;
    }
    
    public final void setId(@org.jetbrains.annotations.NotNull()
    java.lang.String p0) {
    }
    
    @org.jetbrains.annotations.NotNull()
    public final java.lang.String getFullname() {
        return null;
    }
    
    public final void setFullname(@org.jetbrains.annotations.NotNull()
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
    
    @org.jetbrains.annotations.Nullable()
    public final it.ninespartans.xmanager.model.Device getLeftDevice() {
        return null;
    }
    
    public final void setLeftDevice(@org.jetbrains.annotations.Nullable()
    it.ninespartans.xmanager.model.Device p0) {
    }
    
    @org.jetbrains.annotations.Nullable()
    public final it.ninespartans.xmanager.model.Device getRightDevice() {
        return null;
    }
    
    public final void setRightDevice(@org.jetbrains.annotations.Nullable()
    it.ninespartans.xmanager.model.Device p0) {
    }
    
    @org.jetbrains.annotations.Nullable()
    public final it.ninespartans.xmanager.model.TrainingSessionProgram getSessionProgram() {
        return null;
    }
    
    public final void setSessionProgram(@org.jetbrains.annotations.Nullable()
    it.ninespartans.xmanager.model.TrainingSessionProgram p0) {
    }
    
    public final boolean getActive() {
        return false;
    }
    
    public final void setActive(boolean p0) {
    }
    
    public Player(@org.jetbrains.annotations.NotNull()
    java.lang.String id, @org.jetbrains.annotations.NotNull()
    java.lang.String fullname, @org.jetbrains.annotations.NotNull()
    java.lang.String role, @org.jetbrains.annotations.NotNull()
    java.lang.String age, @org.jetbrains.annotations.Nullable()
    it.ninespartans.xmanager.model.Device leftDevice, @org.jetbrains.annotations.Nullable()
    it.ninespartans.xmanager.model.Device rightDevice, @org.jetbrains.annotations.Nullable()
    it.ninespartans.xmanager.model.TrainingSessionProgram sessionProgram, boolean active) {
        super();
    }
    
    public Player() {
        super();
    }
}