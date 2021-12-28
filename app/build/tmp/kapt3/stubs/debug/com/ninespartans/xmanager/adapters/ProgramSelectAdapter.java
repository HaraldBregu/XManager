package com.ninespartans.xmanager.adapters;

import java.lang.System;

@kotlin.Metadata(mv = {1, 5, 1}, k = 1, d1 = {"\u0000@\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\u0018\u00002\u00020\u0001B\u001b\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005\u00a2\u0006\u0002\u0010\u0007J\b\u0010\u000f\u001a\u00020\u0010H\u0016J\u0012\u0010\u0011\u001a\u0004\u0018\u00010\u00062\u0006\u0010\u0012\u001a\u00020\u0010H\u0016J\u0010\u0010\u0013\u001a\u00020\u00142\u0006\u0010\u0012\u001a\u00020\u0010H\u0016J$\u0010\u0015\u001a\u00020\u00162\u0006\u0010\u0012\u001a\u00020\u00102\b\u0010\u0017\u001a\u0004\u0018\u00010\u00162\b\u0010\u0018\u001a\u0004\u0018\u00010\u0019H\u0016R\u000e\u0010\b\u001a\u00020\tX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R \u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b\u000b\u0010\f\"\u0004\b\r\u0010\u000e\u00a8\u0006\u001a"}, d2 = {"Lcom/ninespartans/xmanager/adapters/ProgramSelectAdapter;", "Landroid/widget/BaseAdapter;", "context", "Landroid/content/Context;", "programs", "Lio/realm/RealmResults;", "Lcom/ninespartans/xmanager/model/DeviceProgram;", "(Landroid/content/Context;Lio/realm/RealmResults;)V", "inflater", "Landroid/view/LayoutInflater;", "mContext", "getPrograms", "()Lio/realm/RealmResults;", "setPrograms", "(Lio/realm/RealmResults;)V", "getCount", "", "getItem", "position", "getItemId", "", "getView", "Landroid/view/View;", "convertView", "viewGroup", "Landroid/view/ViewGroup;", "app_debug"})
public final class ProgramSelectAdapter extends android.widget.BaseAdapter {
    private final android.content.Context mContext = null;
    private android.view.LayoutInflater inflater;
    @org.jetbrains.annotations.NotNull()
    private io.realm.RealmResults<com.ninespartans.xmanager.model.DeviceProgram> programs;
    
    public ProgramSelectAdapter(@org.jetbrains.annotations.NotNull()
    android.content.Context context, @org.jetbrains.annotations.NotNull()
    io.realm.RealmResults<com.ninespartans.xmanager.model.DeviceProgram> programs) {
        super();
    }
    
    @org.jetbrains.annotations.NotNull()
    public final io.realm.RealmResults<com.ninespartans.xmanager.model.DeviceProgram> getPrograms() {
        return null;
    }
    
    public final void setPrograms(@org.jetbrains.annotations.NotNull()
    io.realm.RealmResults<com.ninespartans.xmanager.model.DeviceProgram> p0) {
    }
    
    @java.lang.Override()
    public int getCount() {
        return 0;
    }
    
    @java.lang.Override()
    public long getItemId(int position) {
        return 0L;
    }
    
    @org.jetbrains.annotations.Nullable()
    @java.lang.Override()
    public com.ninespartans.xmanager.model.DeviceProgram getItem(int position) {
        return null;
    }
    
    @org.jetbrains.annotations.NotNull()
    @java.lang.Override()
    public android.view.View getView(int position, @org.jetbrains.annotations.Nullable()
    android.view.View convertView, @org.jetbrains.annotations.Nullable()
    android.view.ViewGroup viewGroup) {
        return null;
    }
}