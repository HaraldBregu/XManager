package com.ninespartans.xmanager;

import java.lang.System;

@kotlin.Metadata(mv = {1, 1, 15}, bv = {1, 0, 3}, k = 1, d1 = {"\u0000v\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u000b\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\u0018\u00002\u00020\u0001:\u0001;B\u0005\u00a2\u0006\u0002\u0010\u0002J\u0012\u0010\"\u001a\u00020#2\b\u0010$\u001a\u0004\u0018\u00010%H\u0014J\u0012\u0010&\u001a\u00020\u00122\b\u0010\'\u001a\u0004\u0018\u00010(H\u0016J\u0010\u0010)\u001a\u00020\u00122\u0006\u0010*\u001a\u00020+H\u0016J\b\u0010,\u001a\u00020#H\u0014J0\u0010-\u001a\u00020#2\u0006\u0010.\u001a\u00020/2\f\u00100\u001a\b\u0012\u0004\u0012\u000202012\b\b\u0002\u00103\u001a\u0002042\b\b\u0002\u00105\u001a\u000206J\u0006\u00107\u001a\u00020#J\u000e\u00108\u001a\u00020#2\u0006\u0010.\u001a\u00020/J0\u00109\u001a\u00020#2\u0006\u0010.\u001a\u00020/2\f\u0010:\u001a\b\u0012\u0004\u0012\u000202012\b\b\u0002\u00103\u001a\u0002042\b\b\u0002\u00105\u001a\u000206R\u000e\u0010\u0003\u001a\u00020\u0004X\u0082.\u00a2\u0006\u0002\n\u0000R\u001a\u0010\u0005\u001a\u00020\u0006X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b\u0007\u0010\b\"\u0004\b\t\u0010\nR\u001a\u0010\u000b\u001a\u00020\fX\u0086.\u00a2\u0006\u000e\n\u0000\u001a\u0004\b\r\u0010\u000e\"\u0004\b\u000f\u0010\u0010R\u001a\u0010\u0011\u001a\u00020\u0012X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b\u0013\u0010\u0014\"\u0004\b\u0015\u0010\u0016R\u0019\u0010\u0017\u001a\n \u0019*\u0004\u0018\u00010\u00180\u0018\u00a2\u0006\b\n\u0000\u001a\u0004\b\u001a\u0010\u001bR\u001c\u0010\u001c\u001a\u0004\u0018\u00010\u001dX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b\u001e\u0010\u001f\"\u0004\b \u0010!\u00a8\u0006<"}, d2 = {"Lcom/ninespartans/xmanager/MainActivity;", "Landroidx/appcompat/app/AppCompatActivity;", "()V", "adapter", "Lcom/ninespartans/xmanager/adapters/MainListAdapter;", "animator", "Landroid/animation/ValueAnimator;", "getAnimator", "()Landroid/animation/ValueAnimator;", "setAnimator", "(Landroid/animation/ValueAnimator;)V", "bottomSheetDialog", "Lcom/google/android/material/bottomsheet/BottomSheetDialog;", "getBottomSheetDialog", "()Lcom/google/android/material/bottomsheet/BottomSheetDialog;", "setBottomSheetDialog", "(Lcom/google/android/material/bottomsheet/BottomSheetDialog;)V", "programUploaded", "", "getProgramUploaded", "()Z", "setProgramUploaded", "(Z)V", "realm", "Lio/realm/Realm;", "kotlin.jvm.PlatformType", "getRealm", "()Lio/realm/Realm;", "uploadProgressProgram", "Landroid/widget/ProgressBar;", "getUploadProgressProgram", "()Landroid/widget/ProgressBar;", "setUploadProgressProgram", "(Landroid/widget/ProgressBar;)V", "onCreate", "", "savedInstanceState", "Landroid/os/Bundle;", "onCreateOptionsMenu", "menu", "Landroid/view/Menu;", "onOptionsItemSelected", "item", "Landroid/view/MenuItem;", "onStart", "presenBottomtSheetUploader", "trainingProgram", "Lcom/ninespartans/xmanager/model/TrainingProgram;", "players", "Lio/realm/RealmResults;", "Lcom/ninespartans/xmanager/model/User;", "playerIndex", "", "foot", "Lcom/ninespartans/xmanager/MainActivity$Foot;", "presentProgramBottomSheet", "startTrainingProgram", "uploadProgramToPlayer", "users", "Foot", "app_debug"})
public final class MainActivity extends androidx.appcompat.app.AppCompatActivity {
    private com.ninespartans.xmanager.adapters.MainListAdapter adapter;
    private boolean programUploaded;
    @org.jetbrains.annotations.NotNull()
    public com.google.android.material.bottomsheet.BottomSheetDialog bottomSheetDialog;
    @org.jetbrains.annotations.Nullable()
    private android.widget.ProgressBar uploadProgressProgram;
    @org.jetbrains.annotations.NotNull()
    private android.animation.ValueAnimator animator;
    private final io.realm.Realm realm = null;
    private java.util.HashMap _$_findViewCache;
    
    public final boolean getProgramUploaded() {
        return false;
    }
    
    public final void setProgramUploaded(boolean p0) {
    }
    
    @org.jetbrains.annotations.NotNull()
    public final com.google.android.material.bottomsheet.BottomSheetDialog getBottomSheetDialog() {
        return null;
    }
    
    public final void setBottomSheetDialog(@org.jetbrains.annotations.NotNull()
    com.google.android.material.bottomsheet.BottomSheetDialog p0) {
    }
    
    @org.jetbrains.annotations.Nullable()
    public final android.widget.ProgressBar getUploadProgressProgram() {
        return null;
    }
    
    public final void setUploadProgressProgram(@org.jetbrains.annotations.Nullable()
    android.widget.ProgressBar p0) {
    }
    
    @org.jetbrains.annotations.NotNull()
    public final android.animation.ValueAnimator getAnimator() {
        return null;
    }
    
    public final void setAnimator(@org.jetbrains.annotations.NotNull()
    android.animation.ValueAnimator p0) {
    }
    
    public final io.realm.Realm getRealm() {
        return null;
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
    public final void presentProgramBottomSheet() {
    }
    
    public final void presenBottomtSheetUploader(@org.jetbrains.annotations.NotNull()
    com.ninespartans.xmanager.model.TrainingProgram trainingProgram, @org.jetbrains.annotations.NotNull()
    io.realm.RealmResults<com.ninespartans.xmanager.model.User> players, int playerIndex, @org.jetbrains.annotations.NotNull()
    com.ninespartans.xmanager.MainActivity.Foot foot) {
    }
    
    public final void uploadProgramToPlayer(@org.jetbrains.annotations.NotNull()
    com.ninespartans.xmanager.model.TrainingProgram trainingProgram, @org.jetbrains.annotations.NotNull()
    io.realm.RealmResults<com.ninespartans.xmanager.model.User> users, int playerIndex, @org.jetbrains.annotations.NotNull()
    com.ninespartans.xmanager.MainActivity.Foot foot) {
    }
    
    public final void startTrainingProgram(@org.jetbrains.annotations.NotNull()
    com.ninespartans.xmanager.model.TrainingProgram trainingProgram) {
    }
    
    public MainActivity() {
        super();
    }
    
    @kotlin.Metadata(mv = {1, 1, 15}, bv = {1, 0, 3}, k = 1, d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\b\u0004\b\u0086\u0001\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001B\u0007\b\u0002\u00a2\u0006\u0002\u0010\u0002j\u0002\b\u0003j\u0002\b\u0004\u00a8\u0006\u0005"}, d2 = {"Lcom/ninespartans/xmanager/MainActivity$Foot;", "", "(Ljava/lang/String;I)V", "LEFT", "RIGHT", "app_debug"})
    public static enum Foot {
        /*public static final*/ LEFT /* = new LEFT() */ /*enum*/ ,
        /*public static final*/ RIGHT /* = new RIGHT() */ /*enum*/ ;
        
        Foot() {
        }
    }
}