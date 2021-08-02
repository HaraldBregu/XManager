package it.ninespartans.xmanager.model;

import java.lang.System;

@kotlin.Metadata(mv = {1, 1, 15}, bv = {1, 0, 3}, k = 1, d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0016\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0010\u0012\n\u0002\b\u0002\b\u0016\u0018\u00002\u00020\u0001BI\u0012\b\b\u0002\u0010\u0002\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u0004\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u0005\u001a\u00020\u0003\u0012\u000e\b\u0002\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\b0\u0007\u0012\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\n\u0012\b\b\u0002\u0010\u000b\u001a\u00020\f\u00a2\u0006\u0002\u0010\rJ\u0006\u0010\"\u001a\u00020#J\u0006\u0010$\u001a\u00020#J\u0006\u0010%\u001a\u00020#J\u0006\u0010&\u001a\u00020\'J\u0006\u0010(\u001a\u00020\'R\u001a\u0010\u000b\u001a\u00020\fX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b\u000e\u0010\u000f\"\u0004\b\u0010\u0010\u0011R\u001a\u0010\u0005\u001a\u00020\u0003X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b\u0012\u0010\u0013\"\u0004\b\u0014\u0010\u0015R\u001e\u0010\u0002\u001a\u00020\u00038\u0006@\u0006X\u0087\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b\u0016\u0010\u0013\"\u0004\b\u0017\u0010\u0015R \u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\b0\u0007X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b\u0018\u0010\u0019\"\u0004\b\u001a\u0010\u001bR\u001c\u0010\t\u001a\u0004\u0018\u00010\nX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b\u001c\u0010\u001d\"\u0004\b\u001e\u0010\u001fR\u001a\u0010\u0004\u001a\u00020\u0003X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b \u0010\u0013\"\u0004\b!\u0010\u0015\u00a8\u0006)"}, d2 = {"Lit/ninespartans/xmanager/model/TrainingSessionProgram;", "Lio/realm/RealmObject;", "id", "", "title", "description", "programList", "Lio/realm/RealmList;", "Lit/ninespartans/xmanager/model/Program;", "startDate", "Ljava/util/Date;", "active", "", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lio/realm/RealmList;Ljava/util/Date;Z)V", "getActive", "()Z", "setActive", "(Z)V", "getDescription", "()Ljava/lang/String;", "setDescription", "(Ljava/lang/String;)V", "getId", "setId", "getProgramList", "()Lio/realm/RealmList;", "setProgramList", "(Lio/realm/RealmList;)V", "getStartDate", "()Ljava/util/Date;", "setStartDate", "(Ljava/util/Date;)V", "getTitle", "setTitle", "durationHours", "", "durationMinutes", "durationSeconds", "programBytesLeftDevice", "", "programBytesRightDevice", "app_debug"})
public class TrainingSessionProgram extends io.realm.RealmObject {
    @org.jetbrains.annotations.NotNull()
    @io.realm.annotations.PrimaryKey()
    private java.lang.String id;
    @org.jetbrains.annotations.NotNull()
    private java.lang.String title;
    @org.jetbrains.annotations.NotNull()
    private java.lang.String description;
    @org.jetbrains.annotations.NotNull()
    private io.realm.RealmList<it.ninespartans.xmanager.model.Program> programList;
    @org.jetbrains.annotations.Nullable()
    private java.util.Date startDate;
    private boolean active;
    
    @org.jetbrains.annotations.NotNull()
    public final byte[] programBytesLeftDevice() {
        return null;
    }
    
    @org.jetbrains.annotations.NotNull()
    public final byte[] programBytesRightDevice() {
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
    public final java.lang.String getId() {
        return null;
    }
    
    public final void setId(@org.jetbrains.annotations.NotNull()
    java.lang.String p0) {
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
    public final io.realm.RealmList<it.ninespartans.xmanager.model.Program> getProgramList() {
        return null;
    }
    
    public final void setProgramList(@org.jetbrains.annotations.NotNull()
    io.realm.RealmList<it.ninespartans.xmanager.model.Program> p0) {
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
    
    public TrainingSessionProgram(@org.jetbrains.annotations.NotNull()
    java.lang.String id, @org.jetbrains.annotations.NotNull()
    java.lang.String title, @org.jetbrains.annotations.NotNull()
    java.lang.String description, @org.jetbrains.annotations.NotNull()
    io.realm.RealmList<it.ninespartans.xmanager.model.Program> programList, @org.jetbrains.annotations.Nullable()
    java.util.Date startDate, boolean active) {
        super();
    }
    
    public TrainingSessionProgram() {
        super();
    }
}