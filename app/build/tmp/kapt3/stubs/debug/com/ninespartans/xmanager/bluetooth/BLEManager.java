package com.ninespartans.xmanager.bluetooth;

import java.lang.System;

@kotlin.Metadata(mv = {1, 1, 15}, bv = {1, 0, 3}, k = 1, d1 = {"\u0000\u0094\u0001\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u000b\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\n\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\t\n\u0002\b\u0004\n\u0002\u0010\u000e\n\u0002\b\t\n\u0002\u0010\u0012\n\u0002\b\u0002\b\u00c6\u0002\u0018\u00002\u00020\u0001B\u0007\b\u0002\u00a2\u0006\u0002\u0010\u0002J\u000e\u0010K\u001a\u00020\n2\u0006\u0010L\u001a\u00020MJ\u000e\u0010N\u001a\u00020\n2\u0006\u0010L\u001a\u00020MJ\u0006\u0010O\u001a\u00020\nJ\u000e\u0010P\u001a\u00020\n2\u0006\u0010L\u001a\u00020MJ\u0006\u0010Q\u001a\u00020\u0015J\u000e\u0010R\u001a\u00020\n2\u0006\u0010L\u001a\u00020MJ\u000e\u0010S\u001a\u00020\u00152\u0006\u0010L\u001a\u00020MJ\u0006\u0010T\u001a\u00020\nJ\u0006\u0010U\u001a\u00020\nJ\u0006\u0010V\u001a\u00020\u0015J\"\u0010W\u001a\u00020\u00152\u0010\b\u0002\u0010X\u001a\n\u0012\u0004\u0012\u00020\u0015\u0018\u0001012\b\b\u0002\u0010Y\u001a\u00020ZJ\u0006\u0010[\u001a\u00020\u0015J\u000e\u0010\\\u001a\u00020\n2\u0006\u0010L\u001a\u00020MJ\u000e\u0010]\u001a\u00020\u00152\u0006\u0010^\u001a\u00020_J\u0016\u0010`\u001a\u00020\n2\u0006\u0010a\u001a\u00020_2\u0006\u0010L\u001a\u00020MJ\u000e\u0010b\u001a\u00020\u00152\u0006\u0010c\u001a\u00020\u0014J\u0010\u0010d\u001a\u00020\u00152\b\b\u0002\u0010e\u001a\u00020ZJ\u0006\u0010f\u001a\u00020\u0015J\u000e\u0010g\u001a\u00020\u00152\u0006\u0010h\u001a\u00020iJ\u000e\u0010g\u001a\u00020\u00152\u0006\u0010j\u001a\u00020_R\u001e\u0010\u0003\u001a\u0004\u0018\u00010\u00048FX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b\u0005\u0010\u0006\"\u0004\b\u0007\u0010\bR\u001c\u0010\t\u001a\u00020\n8FX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b\u000b\u0010\f\"\u0004\b\r\u0010\u000eR\u000e\u0010\u000f\u001a\u00020\nX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u0010\u001a\u0004\u0018\u00010\u0011X\u0082\u000e\u00a2\u0006\u0002\n\u0000R&\u0010\u0012\u001a\u000e\u0012\u0004\u0012\u00020\u0014\u0012\u0004\u0012\u00020\u00150\u0013X\u0086.\u00a2\u0006\u000e\n\u0000\u001a\u0004\b\u0016\u0010\u0017\"\u0004\b\u0018\u0010\u0019R*\u0010\u001a\u001a\u0012\u0012\u0006\u0012\u0004\u0018\u00010\u001b\u0012\u0004\u0012\u00020\u0015\u0018\u00010\u0013X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b\u001c\u0010\u0017\"\u0004\b\u001d\u0010\u0019R*\u0010\u001e\u001a\u0012\u0012\u0006\u0012\u0004\u0018\u00010\u001b\u0012\u0004\u0012\u00020\u0015\u0018\u00010\u0013X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b\u001f\u0010\u0017\"\u0004\b \u0010\u0019Ra\u0010!\u001aI\u0012\u0013\u0012\u00110\u0011\u00a2\u0006\f\b#\u0012\b\b$\u0012\u0004\b\b(%\u0012\u0013\u0012\u00110&\u00a2\u0006\f\b#\u0012\b\b$\u0012\u0004\b\b(\'\u0012\u0013\u0012\u00110&\u00a2\u0006\f\b#\u0012\b\b$\u0012\u0004\b\b((\u0012\u0004\u0012\u00020\u0015\u0018\u00010\"X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b)\u0010*\"\u0004\b+\u0010,R(\u0010-\u001a\u0010\u0012\u0004\u0012\u00020\n\u0012\u0004\u0012\u00020\u0015\u0018\u00010\u0013X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b.\u0010\u0017\"\u0004\b/\u0010\u0019R \u00100\u001a\b\u0012\u0004\u0012\u00020\u001501X\u0086.\u00a2\u0006\u000e\n\u0000\u001a\u0004\b2\u00103\"\u0004\b4\u00105R \u00106\u001a\b\u0012\u0004\u0012\u00020\u001501X\u0086.\u00a2\u0006\u000e\n\u0000\u001a\u0004\b7\u00103\"\u0004\b8\u00105R\u000e\u00109\u001a\u00020\nX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010:\u001a\u00020;X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u001a\u0010<\u001a\u00020=X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b>\u0010?\"\u0004\b@\u0010AR\u001a\u0010B\u001a\u00020\nX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\bC\u0010\f\"\u0004\bD\u0010\u000eR\u000e\u0010E\u001a\u00020\u001bX\u0082.\u00a2\u0006\u0002\n\u0000R\u000e\u0010F\u001a\u00020GX\u0082.\u00a2\u0006\u0002\n\u0000R\u000e\u0010H\u001a\u00020\u0014X\u0082.\u00a2\u0006\u0002\n\u0000R\u000e\u0010I\u001a\u00020JX\u0082.\u00a2\u0006\u0002\n\u0000\u00a8\u0006k"}, d2 = {"Lcom/ninespartans/xmanager/bluetooth/BLEManager;", "", "()V", "adapter", "Landroid/bluetooth/BluetoothAdapter;", "getAdapter", "()Landroid/bluetooth/BluetoothAdapter;", "setAdapter", "(Landroid/bluetooth/BluetoothAdapter;)V", "adapterEnabled", "", "getAdapterEnabled", "()Z", "setAdapterEnabled", "(Z)V", "bleConnected", "bluetoothGatt", "Landroid/bluetooth/BluetoothGatt;", "didFoundDevice", "Lkotlin/Function1;", "Landroid/bluetooth/BluetoothDevice;", "", "getDidFoundDevice", "()Lkotlin/jvm/functions/Function1;", "setDidFoundDevice", "(Lkotlin/jvm/functions/Function1;)V", "onCharacteristicRead", "Landroid/bluetooth/BluetoothGattCharacteristic;", "getOnCharacteristicRead", "setOnCharacteristicRead", "onCharacteristicWrite", "getOnCharacteristicWrite", "setOnCharacteristicWrite", "onConnectionStateChange", "Lkotlin/Function3;", "Lkotlin/ParameterName;", "name", "bleGatt", "", "status", "newState", "getOnConnectionStateChange", "()Lkotlin/jvm/functions/Function3;", "setOnConnectionStateChange", "(Lkotlin/jvm/functions/Function3;)V", "onServiceDiscovered", "getOnServiceDiscovered", "setOnServiceDiscovered", "onStartScanning", "Lkotlin/Function0;", "getOnStartScanning", "()Lkotlin/jvm/functions/Function0;", "setOnStartScanning", "(Lkotlin/jvm/functions/Function0;)V", "onStopScanning", "getOnStopScanning", "setOnStopScanning", "reading", "scanCallBack", "Landroid/bluetooth/le/ScanCallback;", "scanner", "Landroid/bluetooth/le/BluetoothLeScanner;", "getScanner", "()Landroid/bluetooth/le/BluetoothLeScanner;", "setScanner", "(Landroid/bluetooth/le/BluetoothLeScanner;)V", "scanning", "getScanning", "setScanning", "selectedCharacteristic", "selectedDescriptor", "Landroid/bluetooth/BluetoothGattDescriptor;", "selectedDevice", "selectedService", "Landroid/bluetooth/BluetoothGattService;", "bleAdminGranted", "context", "Landroid/content/Context;", "bleGranted", "bleIsEnabled", "canStart", "close", "coarseLocationGranted", "connectDevice", "connected", "deviceConnected", "disableReading", "disconnectDevice", "completion", "after", "", "enableReading", "fineLocationGranted", "getDevice", "address", "", "isPermissionGranted", "permission", "selectDevice", "device", "startScanning", "stopAfter", "stopScanning", "write", "byteArray", "", "string", "app_debug"})
public final class BLEManager {
    @org.jetbrains.annotations.NotNull()
    public static kotlin.jvm.functions.Function1<? super android.bluetooth.BluetoothDevice, kotlin.Unit> didFoundDevice;
    @org.jetbrains.annotations.NotNull()
    public static kotlin.jvm.functions.Function0<kotlin.Unit> onStartScanning;
    @org.jetbrains.annotations.NotNull()
    public static kotlin.jvm.functions.Function0<kotlin.Unit> onStopScanning;
    @org.jetbrains.annotations.Nullable()
    private static kotlin.jvm.functions.Function3<? super android.bluetooth.BluetoothGatt, ? super java.lang.Integer, ? super java.lang.Integer, kotlin.Unit> onConnectionStateChange;
    @org.jetbrains.annotations.Nullable()
    private static kotlin.jvm.functions.Function1<? super java.lang.Boolean, kotlin.Unit> onServiceDiscovered;
    @org.jetbrains.annotations.Nullable()
    private static kotlin.jvm.functions.Function1<? super android.bluetooth.BluetoothGattCharacteristic, kotlin.Unit> onCharacteristicRead;
    @org.jetbrains.annotations.Nullable()
    private static kotlin.jvm.functions.Function1<? super android.bluetooth.BluetoothGattCharacteristic, kotlin.Unit> onCharacteristicWrite;
    private static boolean scanning;
    private static android.bluetooth.BluetoothDevice selectedDevice;
    private static boolean bleConnected;
    private static android.bluetooth.BluetoothGatt bluetoothGatt;
    private static android.bluetooth.BluetoothGattService selectedService;
    private static android.bluetooth.BluetoothGattCharacteristic selectedCharacteristic;
    private static android.bluetooth.BluetoothGattDescriptor selectedDescriptor;
    private static boolean reading;
    @org.jetbrains.annotations.Nullable()
    private static android.bluetooth.BluetoothAdapter adapter;
    private static boolean adapterEnabled;
    @org.jetbrains.annotations.NotNull()
    private static android.bluetooth.le.BluetoothLeScanner scanner;
    private static final android.bluetooth.le.ScanCallback scanCallBack = null;
    public static final com.ninespartans.xmanager.bluetooth.BLEManager INSTANCE = null;
    
    @org.jetbrains.annotations.NotNull()
    public final kotlin.jvm.functions.Function1<android.bluetooth.BluetoothDevice, kotlin.Unit> getDidFoundDevice() {
        return null;
    }
    
    public final void setDidFoundDevice(@org.jetbrains.annotations.NotNull()
    kotlin.jvm.functions.Function1<? super android.bluetooth.BluetoothDevice, kotlin.Unit> p0) {
    }
    
    @org.jetbrains.annotations.NotNull()
    public final kotlin.jvm.functions.Function0<kotlin.Unit> getOnStartScanning() {
        return null;
    }
    
    public final void setOnStartScanning(@org.jetbrains.annotations.NotNull()
    kotlin.jvm.functions.Function0<kotlin.Unit> p0) {
    }
    
    @org.jetbrains.annotations.NotNull()
    public final kotlin.jvm.functions.Function0<kotlin.Unit> getOnStopScanning() {
        return null;
    }
    
    public final void setOnStopScanning(@org.jetbrains.annotations.NotNull()
    kotlin.jvm.functions.Function0<kotlin.Unit> p0) {
    }
    
    @org.jetbrains.annotations.Nullable()
    public final kotlin.jvm.functions.Function3<android.bluetooth.BluetoothGatt, java.lang.Integer, java.lang.Integer, kotlin.Unit> getOnConnectionStateChange() {
        return null;
    }
    
    public final void setOnConnectionStateChange(@org.jetbrains.annotations.Nullable()
    kotlin.jvm.functions.Function3<? super android.bluetooth.BluetoothGatt, ? super java.lang.Integer, ? super java.lang.Integer, kotlin.Unit> p0) {
    }
    
    @org.jetbrains.annotations.Nullable()
    public final kotlin.jvm.functions.Function1<java.lang.Boolean, kotlin.Unit> getOnServiceDiscovered() {
        return null;
    }
    
    public final void setOnServiceDiscovered(@org.jetbrains.annotations.Nullable()
    kotlin.jvm.functions.Function1<? super java.lang.Boolean, kotlin.Unit> p0) {
    }
    
    @org.jetbrains.annotations.Nullable()
    public final kotlin.jvm.functions.Function1<android.bluetooth.BluetoothGattCharacteristic, kotlin.Unit> getOnCharacteristicRead() {
        return null;
    }
    
    public final void setOnCharacteristicRead(@org.jetbrains.annotations.Nullable()
    kotlin.jvm.functions.Function1<? super android.bluetooth.BluetoothGattCharacteristic, kotlin.Unit> p0) {
    }
    
    @org.jetbrains.annotations.Nullable()
    public final kotlin.jvm.functions.Function1<android.bluetooth.BluetoothGattCharacteristic, kotlin.Unit> getOnCharacteristicWrite() {
        return null;
    }
    
    public final void setOnCharacteristicWrite(@org.jetbrains.annotations.Nullable()
    kotlin.jvm.functions.Function1<? super android.bluetooth.BluetoothGattCharacteristic, kotlin.Unit> p0) {
    }
    
    public final boolean getScanning() {
        return false;
    }
    
    public final void setScanning(boolean p0) {
    }
    
    @org.jetbrains.annotations.Nullable()
    public final android.bluetooth.BluetoothAdapter getAdapter() {
        return null;
    }
    
    public final void setAdapter(@org.jetbrains.annotations.Nullable()
    android.bluetooth.BluetoothAdapter p0) {
    }
    
    public final boolean getAdapterEnabled() {
        return false;
    }
    
    public final void setAdapterEnabled(boolean p0) {
    }
    
    @org.jetbrains.annotations.NotNull()
    public final android.bluetooth.le.BluetoothLeScanner getScanner() {
        return null;
    }
    
    public final void setScanner(@org.jetbrains.annotations.NotNull()
    android.bluetooth.le.BluetoothLeScanner p0) {
    }
    
    /**
     * Scan for devices
     */
    public final void startScanning(long stopAfter) {
    }
    
    /**
     * Get Device by MAC
     */
    public final void getDevice(@org.jetbrains.annotations.NotNull()
    java.lang.String address) {
    }
    
    public final void stopScanning() {
    }
    
    /**
     * Select the device
     */
    public final void selectDevice(@org.jetbrains.annotations.NotNull()
    android.bluetooth.BluetoothDevice device) {
    }
    
    /**
     * Disconnect to Device
     * Callback handler when done
     */
    public final void disconnectDevice(@org.jetbrains.annotations.Nullable()
    kotlin.jvm.functions.Function0<kotlin.Unit> completion, long after) {
    }
    
    public final boolean connected() {
        return false;
    }
    
    /**
     * Connect to Device
     */
    public final void connectDevice(@org.jetbrains.annotations.NotNull()
    android.content.Context context) {
    }
    
    public final boolean deviceConnected() {
        return false;
    }
    
    public final void enableReading() {
    }
    
    public final void disableReading() {
    }
    
    public final void write(@org.jetbrains.annotations.NotNull()
    byte[] byteArray) {
    }
    
    public final void write(@org.jetbrains.annotations.NotNull()
    java.lang.String string) {
    }
    
    public final void close() {
    }
    
    /**
     * Util function
     * Function to check if some permission is granted
     */
    public final boolean isPermissionGranted(@org.jetbrains.annotations.NotNull()
    java.lang.String permission, @org.jetbrains.annotations.NotNull()
    android.content.Context context) {
        return false;
    }
    
    public final boolean bleGranted(@org.jetbrains.annotations.NotNull()
    android.content.Context context) {
        return false;
    }
    
    public final boolean bleAdminGranted(@org.jetbrains.annotations.NotNull()
    android.content.Context context) {
        return false;
    }
    
    public final boolean coarseLocationGranted(@org.jetbrains.annotations.NotNull()
    android.content.Context context) {
        return false;
    }
    
    public final boolean fineLocationGranted(@org.jetbrains.annotations.NotNull()
    android.content.Context context) {
        return false;
    }
    
    public final boolean bleIsEnabled() {
        return false;
    }
    
    public final boolean canStart(@org.jetbrains.annotations.NotNull()
    android.content.Context context) {
        return false;
    }
    
    private BLEManager() {
        super();
    }
}