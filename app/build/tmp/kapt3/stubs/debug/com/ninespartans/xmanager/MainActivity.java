package com.ninespartans.xmanager;

import java.lang.System;

@kotlin.Metadata(mv = {1, 5, 1}, k = 1, d1 = {"\u0000t\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\u0018\u00002\u00020\u0001B\u0005\u00a2\u0006\u0002\u0010\u0002J\u0012\u0010\u0011\u001a\u00020\u00122\b\u0010\u0013\u001a\u0004\u0018\u00010\u0014H\u0014J\u0012\u0010\u0015\u001a\u00020\f2\b\u0010\u0016\u001a\u0004\u0018\u00010\u0017H\u0016J\u0010\u0010\u0018\u001a\u00020\f2\u0006\u0010\u0019\u001a\u00020\u001aH\u0016J\b\u0010\u001b\u001a\u00020\u0012H\u0014J(\u0010\u001c\u001a\u00020\u00122\u0006\u0010\u001d\u001a\u00020\u001e2\f\u0010\u001f\u001a\b\u0012\u0004\u0012\u00020!0 2\b\b\u0002\u0010\"\u001a\u00020#H\u0002J\u0014\u0010$\u001a\u00020\u00122\n\b\u0002\u0010%\u001a\u0004\u0018\u00010&H\u0002J(\u0010\'\u001a\u00020\u00122\u0006\u0010\u001d\u001a\u00020\u001e2\f\u0010\u001f\u001a\b\u0012\u0004\u0012\u00020!0 2\b\b\u0002\u0010\"\u001a\u00020#H\u0002R\u000e\u0010\u0003\u001a\u00020\u0004X\u0082.\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0006X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\bX\u0082.\u00a2\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\nX\u0082.\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000b\u001a\u00020\fX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\r\u001a\u00020\u000eX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u000f\u001a\u0004\u0018\u00010\u0010X\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006("}, d2 = {"Lcom/ninespartans/xmanager/MainActivity;", "Landroidx/appcompat/app/AppCompatActivity;", "()V", "adapter", "Lcom/ninespartans/xmanager/adapters/MainListAdapter;", "animator", "Landroid/animation/ValueAnimator;", "binding", "Lcom/ninespartans/xmanager/databinding/ActivityMainBinding;", "bottomSheetDialog", "Lcom/google/android/material/bottomsheet/BottomSheetDialog;", "programUploaded", "", "realm", "Lio/realm/Realm;", "uploadProgressProgram", "Landroid/widget/ProgressBar;", "onCreate", "", "savedInstanceState", "Landroid/os/Bundle;", "onCreateOptionsMenu", "menu", "Landroid/view/Menu;", "onOptionsItemSelected", "item", "Landroid/view/MenuItem;", "onStart", "presentBottomSheetDialogUploader", "deviceProgram", "Lcom/ninespartans/xmanager/model/DeviceProgram;", "devices", "Lio/realm/RealmResults;", "Lcom/ninespartans/xmanager/model/Device;", "deviceIndex", "", "presentProgramsListBottomSheet", "user", "Lcom/ninespartans/xmanager/model/User;", "uploadProgramToDevice", "app_debug"})
public final class MainActivity extends androidx.appcompat.app.AppCompatActivity {
    private com.ninespartans.xmanager.databinding.ActivityMainBinding binding;
    private com.ninespartans.xmanager.adapters.MainListAdapter adapter;
    private boolean programUploaded = false;
    private com.google.android.material.bottomsheet.BottomSheetDialog bottomSheetDialog;
    private android.widget.ProgressBar uploadProgressProgram;
    private android.animation.ValueAnimator animator;
    private final io.realm.Realm realm = null;
    
    public MainActivity() {
        super();
    }
    
    @java.lang.Override()
    protected void onCreate(@org.jetbrains.annotations.Nullable()
    android.os.Bundle savedInstanceState) {
    }
    
    @java.lang.Override()
    protected void onStart() {
    }
    
    @java.lang.Override()
    public boolean onCreateOptionsMenu(@org.jetbrains.annotations.Nullable()
    android.view.Menu menu) {
        return false;
    }
    
    @java.lang.Override()
    public boolean onOptionsItemSelected(@org.jetbrains.annotations.NotNull()
    android.view.MenuItem item) {
        return false;
    }
    
    /**
     * Present list of programs to select
     */
    private final void presentProgramsListBottomSheet(com.ninespartans.xmanager.model.User user) {
    }
    
    /**
     * BottomSheet Dialog Program Uploader
     */
    private final void presentBottomSheetDialogUploader(com.ninespartans.xmanager.model.DeviceProgram deviceProgram, io.realm.RealmResults<com.ninespartans.xmanager.model.Device> devices, int deviceIndex) {
    }
    
    private final void uploadProgramToDevice(com.ninespartans.xmanager.model.DeviceProgram deviceProgram, io.realm.RealmResults<com.ninespartans.xmanager.model.Device> devices, int deviceIndex) {
    }
}