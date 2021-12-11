package com.ninespartans.xmanager;

import java.lang.System;

@kotlin.Metadata(mv = {1, 1, 15}, bv = {1, 0, 3}, k = 1, d1 = {"\u0000d\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0005\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\u0018\u00002\u00020\u0001:\u0001.B\u0005\u00a2\u0006\u0002\u0010\u0002J\b\u0010\u001d\u001a\u00020\u001eH\u0016J\u0012\u0010\u001f\u001a\u00020\u001e2\b\u0010 \u001a\u0004\u0018\u00010!H\u0014J\b\u0010\"\u001a\u00020\u001eH\u0014J\b\u0010#\u001a\u00020\u001eH\u0014J\b\u0010$\u001a\u00020\u001eH\u0014J\b\u0010%\u001a\u00020\fH\u0016J\u000e\u0010&\u001a\u00020\u001e2\u0006\u0010\'\u001a\u00020(J\u0010\u0010)\u001a\u00020\u001e2\u0006\u0010*\u001a\u00020+H\u0002J\u0006\u0010,\u001a\u00020\u001eJ\u0006\u0010-\u001a\u00020\u001eR\u000e\u0010\u0003\u001a\u00020\u0004X\u0082.\u00a2\u0006\u0002\n\u0000R\u001c\u0010\u0005\u001a\u0004\u0018\u00010\u0006X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b\u0007\u0010\b\"\u0004\b\t\u0010\nR\u0014\u0010\u000b\u001a\u00020\fX\u0086D\u00a2\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0010\u0010\u000f\u001a\u0004\u0018\u00010\u0010X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u001e\u0010\u0011\u001a\u0012\u0012\u0004\u0012\u00020\u00130\u0012j\b\u0012\u0004\u0012\u00020\u0013`\u0014X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u0015\u001a\u0004\u0018\u00010\u0016X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u001c\u0010\u0017\u001a\u0004\u0018\u00010\u0018X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b\u0019\u0010\u001a\"\u0004\b\u001b\u0010\u001c\u00a8\u0006/"}, d2 = {"Lcom/ninespartans/xmanager/DevicePairSearchActivity;", "Landroidx/appcompat/app/AppCompatActivity;", "()V", "adapter", "Lcom/ninespartans/xmanager/DevicePairSearchActivity$DeviceAdapter;", "bottomSheetDialog", "Lcom/google/android/material/bottomsheet/BottomSheetDialog;", "getBottomSheetDialog", "()Lcom/google/android/material/bottomsheet/BottomSheetDialog;", "setBottomSheetDialog", "(Lcom/google/android/material/bottomsheet/BottomSheetDialog;)V", "debug", "", "getDebug", "()Z", "deviceInfo", "Lcom/ninespartans/xmanager/model/DeviceInfo;", "discoveredDevices", "Ljava/util/ArrayList;", "Landroid/bluetooth/BluetoothDevice;", "Lkotlin/collections/ArrayList;", "user", "Lcom/ninespartans/xmanager/model/User;", "userId", "", "getUserId", "()Ljava/lang/String;", "setUserId", "(Ljava/lang/String;)V", "onBackPressed", "", "onCreate", "savedInstanceState", "Landroid/os/Bundle;", "onDestroy", "onResume", "onStart", "onSupportNavigateUp", "presentBottomSheet", "position", "", "setWhiteNavigationBar", "dialog", "Landroid/app/Dialog;", "updateList", "updateSearchDevicesButton", "DeviceAdapter", "app_debug"})
public final class DevicePairSearchActivity extends androidx.appcompat.app.AppCompatActivity {
    private java.util.ArrayList<android.bluetooth.BluetoothDevice> discoveredDevices;
    private com.ninespartans.xmanager.DevicePairSearchActivity.DeviceAdapter adapter;
    private com.ninespartans.xmanager.model.DeviceInfo deviceInfo;
    private com.ninespartans.xmanager.model.User user;
    @org.jetbrains.annotations.Nullable()
    private java.lang.String userId;
    private final boolean debug = true;
    @org.jetbrains.annotations.Nullable()
    private com.google.android.material.bottomsheet.BottomSheetDialog bottomSheetDialog;
    private java.util.HashMap _$_findViewCache;
    
    @org.jetbrains.annotations.Nullable()
    public final java.lang.String getUserId() {
        return null;
    }
    
    public final void setUserId(@org.jetbrains.annotations.Nullable()
    java.lang.String p0) {
    }
    
    public final boolean getDebug() {
        return false;
    }
    
    @org.jetbrains.annotations.Nullable()
    public final com.google.android.material.bottomsheet.BottomSheetDialog getBottomSheetDialog() {
        return null;
    }
    
    public final void setBottomSheetDialog(@org.jetbrains.annotations.Nullable()
    com.google.android.material.bottomsheet.BottomSheetDialog p0) {
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
    
    public final void updateSearchDevicesButton() {
    }
    
    public final void presentBottomSheet(int position) {
    }
    
    private final void setWhiteNavigationBar(android.app.Dialog dialog) {
    }
    
    public final void updateList() {
    }
    
    public DevicePairSearchActivity() {
        super();
    }
    
    /**
     * Adapter
     * ListView Adapter
     */
    @kotlin.Metadata(mv = {1, 1, 15}, bv = {1, 0, 3}, k = 1, d1 = {"\u0000J\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\b\u0002\u0018\u00002\u00020\u0001B\r\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0002\u0010\u0004J\b\u0010\u0010\u001a\u00020\u0011H\u0016J\u0010\u0010\u0012\u001a\u00020\u00132\u0006\u0010\u0014\u001a\u00020\u0011H\u0016J\u0010\u0010\u0015\u001a\u00020\u00162\u0006\u0010\u0014\u001a\u00020\u0011H\u0016J$\u0010\u0017\u001a\u00020\u00182\u0006\u0010\u0014\u001a\u00020\u00112\b\u0010\u0019\u001a\u0004\u0018\u00010\u00182\b\u0010\u001a\u001a\u0004\u0018\u00010\u001bH\u0016R\u000e\u0010\u0005\u001a\u00020\u0006X\u0082\u000e\u00a2\u0006\u0002\n\u0000R*\u0010\u0007\u001a\u0012\u0012\u0004\u0012\u00020\t0\bj\b\u0012\u0004\u0012\u00020\t`\nX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b\u000b\u0010\f\"\u0004\b\r\u0010\u000eR\u000e\u0010\u000f\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u001c"}, d2 = {"Lcom/ninespartans/xmanager/DevicePairSearchActivity$DeviceAdapter;", "Landroid/widget/BaseAdapter;", "context", "Landroid/content/Context;", "(Landroid/content/Context;)V", "inflater", "Landroid/view/LayoutInflater;", "items", "Ljava/util/ArrayList;", "Landroid/bluetooth/BluetoothDevice;", "Lkotlin/collections/ArrayList;", "getItems", "()Ljava/util/ArrayList;", "setItems", "(Ljava/util/ArrayList;)V", "mContext", "getCount", "", "getItem", "", "position", "getItemId", "", "getView", "Landroid/view/View;", "convertView", "viewGroup", "Landroid/view/ViewGroup;", "app_debug"})
    static final class DeviceAdapter extends android.widget.BaseAdapter {
        private final android.content.Context mContext = null;
        @org.jetbrains.annotations.NotNull()
        private java.util.ArrayList<android.bluetooth.BluetoothDevice> items;
        private android.view.LayoutInflater inflater;
        
        @org.jetbrains.annotations.NotNull()
        public final java.util.ArrayList<android.bluetooth.BluetoothDevice> getItems() {
            return null;
        }
        
        public final void setItems(@org.jetbrains.annotations.NotNull()
        java.util.ArrayList<android.bluetooth.BluetoothDevice> p0) {
        }
        
        @java.lang.Override()
        public int getCount() {
            return 0;
        }
        
        @java.lang.Override()
        public long getItemId(int position) {
            return 0L;
        }
        
        @org.jetbrains.annotations.NotNull()
        @java.lang.Override()
        public java.lang.Object getItem(int position) {
            return null;
        }
        
        @org.jetbrains.annotations.NotNull()
        @java.lang.Override()
        public android.view.View getView(int position, @org.jetbrains.annotations.Nullable()
        android.view.View convertView, @org.jetbrains.annotations.Nullable()
        android.view.ViewGroup viewGroup) {
            return null;
        }
        
        public DeviceAdapter(@org.jetbrains.annotations.NotNull()
        android.content.Context context) {
            super();
        }
    }
}