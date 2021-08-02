package it.ninespartans.xmanager.model;

import java.lang.System;

@kotlin.Metadata(mv = {1, 1, 15}, bv = {1, 0, 3}, k = 1, d1 = {"\u00002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0005\n\u0002\b\u0016\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0003\n\u0002\u0010\t\n\u0002\b\u0005\b\u0017\u0018\u00002\u00020\u0001:\u0002\'(B\u0005\u00a2\u0006\u0002\u0010\u0002J\u000e\u0010\u0019\u001a\u00020\u00042\u0006\u0010\u001a\u001a\u00020\u001bJ\u000e\u0010\u001c\u001a\u00020\u00042\u0006\u0010\u001d\u001a\u00020\u001eJ6\u0010\u001f\u001a\u00020 2\u0006\u0010!\u001a\u00020\u001e2\u0006\u0010\"\u001a\u00020\u001e2\u0006\u0010\u001a\u001a\u00020\u001b2\u0006\u0010#\u001a\u00020$2\u0006\u0010%\u001a\u00020$2\u0006\u0010&\u001a\u00020$R\u001e\u0010\u0003\u001a\u0004\u0018\u00010\u0004X\u0086\u000e\u00a2\u0006\u0010\n\u0002\u0010\t\u001a\u0004\b\u0005\u0010\u0006\"\u0004\b\u0007\u0010\bR\u001e\u0010\n\u001a\u0004\u0018\u00010\u0004X\u0086\u000e\u00a2\u0006\u0010\n\u0002\u0010\t\u001a\u0004\b\u000b\u0010\u0006\"\u0004\b\f\u0010\bR\u001e\u0010\r\u001a\u0004\u0018\u00010\u0004X\u0086\u000e\u00a2\u0006\u0010\n\u0002\u0010\t\u001a\u0004\b\u000e\u0010\u0006\"\u0004\b\u000f\u0010\bR\u001e\u0010\u0010\u001a\u0004\u0018\u00010\u0004X\u0086\u000e\u00a2\u0006\u0010\n\u0002\u0010\t\u001a\u0004\b\u0011\u0010\u0006\"\u0004\b\u0012\u0010\bR\u001e\u0010\u0013\u001a\u0004\u0018\u00010\u0004X\u0086\u000e\u00a2\u0006\u0010\n\u0002\u0010\t\u001a\u0004\b\u0014\u0010\u0006\"\u0004\b\u0015\u0010\bR\u001e\u0010\u0016\u001a\u0004\u0018\u00010\u0004X\u0086\u000e\u00a2\u0006\u0010\n\u0002\u0010\t\u001a\u0004\b\u0017\u0010\u0006\"\u0004\b\u0018\u0010\b\u00a8\u0006)"}, d2 = {"Lit/ninespartans/xmanager/model/Program;", "Lio/realm/RealmObject;", "()V", "animationByte", "", "getAnimationByte", "()Ljava/lang/Byte;", "setAnimationByte", "(Ljava/lang/Byte;)V", "Ljava/lang/Byte;", "durationHoursByte", "getDurationHoursByte", "setDurationHoursByte", "durationMinutesByte", "getDurationMinutesByte", "setDurationMinutesByte", "durationSecondsByte", "getDurationSecondsByte", "setDurationSecondsByte", "leftDeviceLedPositionByte", "getLeftDeviceLedPositionByte", "setLeftDeviceLedPositionByte", "rightDeviceLedPositionByte", "getRightDeviceLedPositionByte", "setRightDeviceLedPositionByte", "animationToByte", "animation", "Lit/ninespartans/xmanager/model/Program$ShoeLedAnimation;", "ledPositionToByte", "position", "Lit/ninespartans/xmanager/model/Program$ShoeLedPosition;", "setData", "", "leftLedPosition", "rightLedPosition", "hours", "", "minutes", "seconds", "ShoeLedAnimation", "ShoeLedPosition", "app_debug"})
@io.realm.annotations.RealmClass(embedded = true)
public class Program extends io.realm.RealmObject {
    @org.jetbrains.annotations.Nullable()
    private java.lang.Byte leftDeviceLedPositionByte;
    @org.jetbrains.annotations.Nullable()
    private java.lang.Byte rightDeviceLedPositionByte;
    @org.jetbrains.annotations.Nullable()
    private java.lang.Byte animationByte;
    @org.jetbrains.annotations.Nullable()
    private java.lang.Byte durationHoursByte;
    @org.jetbrains.annotations.Nullable()
    private java.lang.Byte durationMinutesByte;
    @org.jetbrains.annotations.Nullable()
    private java.lang.Byte durationSecondsByte;
    
    public final byte ledPositionToByte(@org.jetbrains.annotations.NotNull()
    it.ninespartans.xmanager.model.Program.ShoeLedPosition position) {
        return 0;
    }
    
    public final byte animationToByte(@org.jetbrains.annotations.NotNull()
    it.ninespartans.xmanager.model.Program.ShoeLedAnimation animation) {
        return 0;
    }
    
    @org.jetbrains.annotations.Nullable()
    public final java.lang.Byte getLeftDeviceLedPositionByte() {
        return null;
    }
    
    public final void setLeftDeviceLedPositionByte(@org.jetbrains.annotations.Nullable()
    java.lang.Byte p0) {
    }
    
    @org.jetbrains.annotations.Nullable()
    public final java.lang.Byte getRightDeviceLedPositionByte() {
        return null;
    }
    
    public final void setRightDeviceLedPositionByte(@org.jetbrains.annotations.Nullable()
    java.lang.Byte p0) {
    }
    
    @org.jetbrains.annotations.Nullable()
    public final java.lang.Byte getAnimationByte() {
        return null;
    }
    
    public final void setAnimationByte(@org.jetbrains.annotations.Nullable()
    java.lang.Byte p0) {
    }
    
    @org.jetbrains.annotations.Nullable()
    public final java.lang.Byte getDurationHoursByte() {
        return null;
    }
    
    public final void setDurationHoursByte(@org.jetbrains.annotations.Nullable()
    java.lang.Byte p0) {
    }
    
    @org.jetbrains.annotations.Nullable()
    public final java.lang.Byte getDurationMinutesByte() {
        return null;
    }
    
    public final void setDurationMinutesByte(@org.jetbrains.annotations.Nullable()
    java.lang.Byte p0) {
    }
    
    @org.jetbrains.annotations.Nullable()
    public final java.lang.Byte getDurationSecondsByte() {
        return null;
    }
    
    public final void setDurationSecondsByte(@org.jetbrains.annotations.Nullable()
    java.lang.Byte p0) {
    }
    
    /**
     * Duration
     * Hours
     * Minutes
     * Seconds
     */
    public final void setData(@org.jetbrains.annotations.NotNull()
    it.ninespartans.xmanager.model.Program.ShoeLedPosition leftLedPosition, @org.jetbrains.annotations.NotNull()
    it.ninespartans.xmanager.model.Program.ShoeLedPosition rightLedPosition, @org.jetbrains.annotations.NotNull()
    it.ninespartans.xmanager.model.Program.ShoeLedAnimation animation, long hours, long minutes, long seconds) {
    }
    
    public Program() {
        super();
    }
    
    @kotlin.Metadata(mv = {1, 1, 15}, bv = {1, 0, 3}, k = 1, d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\b\u0007\b\u0086\u0001\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001B\u0007\b\u0002\u00a2\u0006\u0002\u0010\u0002j\u0002\b\u0003j\u0002\b\u0004j\u0002\b\u0005j\u0002\b\u0006j\u0002\b\u0007\u00a8\u0006\b"}, d2 = {"Lit/ninespartans/xmanager/model/Program$ShoeLedPosition;", "", "(Ljava/lang/String;I)V", "TOP", "TOPEXT", "BOTTOMEXT", "TOPINT", "BOTTOMINT", "app_debug"})
    public static enum ShoeLedPosition {
        /*public static final*/ TOP /* = new TOP() */,
        /*public static final*/ TOPEXT /* = new TOPEXT() */,
        /*public static final*/ BOTTOMEXT /* = new BOTTOMEXT() */,
        /*public static final*/ TOPINT /* = new TOPINT() */,
        /*public static final*/ BOTTOMINT /* = new BOTTOMINT() */;
        
        ShoeLedPosition() {
        }
    }
    
    @kotlin.Metadata(mv = {1, 1, 15}, bv = {1, 0, 3}, k = 1, d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\b\u0005\b\u0086\u0001\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001B\u0007\b\u0002\u00a2\u0006\u0002\u0010\u0002j\u0002\b\u0003j\u0002\b\u0004j\u0002\b\u0005\u00a8\u0006\u0006"}, d2 = {"Lit/ninespartans/xmanager/model/Program$ShoeLedAnimation;", "", "(Ljava/lang/String;I)V", "STATIC", "BLINK", "FADE", "app_debug"})
    public static enum ShoeLedAnimation {
        /*public static final*/ STATIC /* = new STATIC() */,
        /*public static final*/ BLINK /* = new BLINK() */,
        /*public static final*/ FADE /* = new FADE() */;
        
        ShoeLedAnimation() {
        }
    }
}