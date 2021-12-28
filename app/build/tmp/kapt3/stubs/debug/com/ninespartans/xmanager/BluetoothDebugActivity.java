package com.ninespartans.xmanager;

import java.lang.System;

@kotlin.Metadata(mv = {1, 5, 1}, k = 1, d1 = {"\u0000N\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0005\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u000e\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\b\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\u000b\n\u0000\u0018\u00002\u00020\u0001B\u0005\u00a2\u0006\u0002\u0010\u0002J\b\u0010%\u001a\u00020&H\u0016J\u0012\u0010\'\u001a\u00020&2\b\u0010(\u001a\u0004\u0018\u00010)H\u0014J\b\u0010*\u001a\u00020&H\u0014J\u000e\u0010+\u001a\u00020&2\u0006\u0010,\u001a\u00020-J\u000e\u0010.\u001a\u00020&2\u0006\u0010,\u001a\u00020-J\b\u0010/\u001a\u00020&H\u0014J\b\u00100\u001a\u00020&H\u0014J\b\u00101\u001a\u000202H\u0016R\u001a\u0010\u0003\u001a\u00020\u0004X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b\u0005\u0010\u0006\"\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\nX\u0082.\u00a2\u0006\u0002\n\u0000R\u001a\u0010\u000b\u001a\u00020\fX\u0086.\u00a2\u0006\u000e\n\u0000\u001a\u0004\b\r\u0010\u000e\"\u0004\b\u000f\u0010\u0010R\u001a\u0010\u0011\u001a\u00020\u0004X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b\u0012\u0010\u0006\"\u0004\b\u0013\u0010\bR\u001a\u0010\u0014\u001a\u00020\u0004X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b\u0015\u0010\u0006\"\u0004\b\u0016\u0010\bR\u001a\u0010\u0017\u001a\u00020\u0004X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b\u0018\u0010\u0006\"\u0004\b\u0019\u0010\bR\u000e\u0010\u001a\u001a\u00020\u001bX\u0082.\u00a2\u0006\u0002\n\u0000R\u001a\u0010\u001c\u001a\u00020\u001dX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b\u001e\u0010\u001f\"\u0004\b \u0010!R\u001a\u0010\"\u001a\u00020\u0004X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b#\u0010\u0006\"\u0004\b$\u0010\b\u00a8\u00063"}, d2 = {"Lcom/ninespartans/xmanager/BluetoothDebugActivity;", "Landroidx/appcompat/app/AppCompatActivity;", "()V", "animationType", "", "getAnimationType", "()B", "setAnimationType", "(B)V", "binding", "Lcom/ninespartans/xmanager/databinding/ActivityBluetoothDebugBinding;", "deviceInfo", "Lcom/ninespartans/xmanager/model/DeviceInfo;", "getDeviceInfo", "()Lcom/ninespartans/xmanager/model/DeviceInfo;", "setDeviceInfo", "(Lcom/ninespartans/xmanager/model/DeviceInfo;)V", "hours", "getHours", "setHours", "ledPosition", "getLedPosition", "setLedPosition", "minutes", "getMinutes", "setMinutes", "player", "Lcom/ninespartans/xmanager/model/User;", "playerId", "", "getPlayerId", "()Ljava/lang/String;", "setPlayerId", "(Ljava/lang/String;)V", "seconds", "getSeconds", "setSeconds", "onBackPressed", "", "onCreate", "savedInstanceState", "Landroid/os/Bundle;", "onDestroy", "onRadioButtonClicked", "view", "Landroid/view/View;", "onRadioLedClicked", "onResume", "onStart", "onSupportNavigateUp", "", "app_debug"})
public final class BluetoothDebugActivity extends androidx.appcompat.app.AppCompatActivity {
    private com.ninespartans.xmanager.databinding.ActivityBluetoothDebugBinding binding;
    public com.ninespartans.xmanager.model.DeviceInfo deviceInfo;
    private com.ninespartans.xmanager.model.User player;
    @org.jetbrains.annotations.NotNull()
    private java.lang.String playerId = "";
    private byte animationType;
    private byte ledPosition;
    private byte hours;
    private byte minutes;
    private byte seconds;
    
    public BluetoothDebugActivity() {
        super();
    }
    
    @org.jetbrains.annotations.NotNull()
    public final com.ninespartans.xmanager.model.DeviceInfo getDeviceInfo() {
        return null;
    }
    
    public final void setDeviceInfo(@org.jetbrains.annotations.NotNull()
    com.ninespartans.xmanager.model.DeviceInfo p0) {
    }
    
    @org.jetbrains.annotations.NotNull()
    public final java.lang.String getPlayerId() {
        return null;
    }
    
    public final void setPlayerId(@org.jetbrains.annotations.NotNull()
    java.lang.String p0) {
    }
    
    public final byte getAnimationType() {
        return 0;
    }
    
    public final void setAnimationType(byte p0) {
    }
    
    public final byte getLedPosition() {
        return 0;
    }
    
    public final void setLedPosition(byte p0) {
    }
    
    public final byte getHours() {
        return 0;
    }
    
    public final void setHours(byte p0) {
    }
    
    public final byte getMinutes() {
        return 0;
    }
    
    public final void setMinutes(byte p0) {
    }
    
    public final byte getSeconds() {
        return 0;
    }
    
    public final void setSeconds(byte p0) {
    }
    
    @java.lang.Override()
    protected void onCreate(@org.jetbrains.annotations.Nullable()
    android.os.Bundle savedInstanceState) {
    }
    
    @java.lang.Override()
    protected void onStart() {
    }
    
    @java.lang.Override()
    protected void onResume() {
    }
    
    @java.lang.Override()
    protected void onDestroy() {
    }
    
    @java.lang.Override()
    public void onBackPressed() {
    }
    
    @java.lang.Override()
    public boolean onSupportNavigateUp() {
        return false;
    }
    
    public final void onRadioButtonClicked(@org.jetbrains.annotations.NotNull()
    android.view.View view) {
    }
    
    public final void onRadioLedClicked(@org.jetbrains.annotations.NotNull()
    android.view.View view) {
    }
}