package com.ninespartans.xmanager;

import java.lang.System;

@kotlin.Metadata(mv = {1, 5, 1}, k = 1, d1 = {"\u0000P\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\u0018\u0000 #2\u00020\u0001:\u0001#B\u0005\u00a2\u0006\u0002\u0010\u0002J\u0012\u0010\u001d\u001a\u00020\u001e2\b\u0010\u001f\u001a\u0004\u0018\u00010 H\u0014J\b\u0010!\u001a\u00020\u001eH\u0014J\b\u0010\"\u001a\u00020\u001eH\u0014R\u000e\u0010\u0003\u001a\u00020\u0004X\u0082.\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0006X\u0082.\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\bX\u0082.\u00a2\u0006\u0002\n\u0000R\u001b\u0010\t\u001a\u00020\n8FX\u0086\u0084\u0002\u00a2\u0006\f\n\u0004\b\r\u0010\u000e\u001a\u0004\b\u000b\u0010\fR#\u0010\u000f\u001a\n \u0011*\u0004\u0018\u00010\u00100\u00108FX\u0086\u0084\u0002\u00a2\u0006\f\n\u0004\b\u0014\u0010\u000e\u001a\u0004\b\u0012\u0010\u0013R\u000e\u0010\u0015\u001a\u00020\u0016X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0017\u001a\u00020\u0018X\u0082.\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u0019\u001a\u00020\u001aX\u0086D\u00a2\u0006\b\n\u0000\u001a\u0004\b\u001b\u0010\u001c\u00a8\u0006$"}, d2 = {"Lcom/ninespartans/xmanager/AppVersionActivity;", "Landroidx/appcompat/app/AppCompatActivity;", "()V", "adapter", "Lcom/ninespartans/xmanager/adapters/AppVersionListAdapter;", "binding", "Lcom/ninespartans/xmanager/databinding/ActivityAppVersionBinding;", "mainApplication", "Lcom/ninespartans/xmanager/common/MainApplication;", "okClient", "Lokhttp3/OkHttpClient;", "getOkClient", "()Lokhttp3/OkHttpClient;", "okClient$delegate", "Lkotlin/Lazy;", "okRequestList", "Lokhttp3/Request;", "kotlin.jvm.PlatformType", "getOkRequestList", "()Lokhttp3/Request;", "okRequestList$delegate", "onCompleteDownload", "Landroid/content/BroadcastReceiver;", "selectedApplication", "Lcom/ninespartans/xmanager/model/AppInfo$Application;", "url", "", "getUrl", "()Ljava/lang/String;", "onCreate", "", "savedInstanceState", "Landroid/os/Bundle;", "onDestroy", "onStart", "Companion", "app_debug"})
public final class AppVersionActivity extends androidx.appcompat.app.AppCompatActivity {
    private com.ninespartans.xmanager.databinding.ActivityAppVersionBinding binding;
    private com.ninespartans.xmanager.adapters.AppVersionListAdapter adapter;
    private com.ninespartans.xmanager.model.AppInfo.Application selectedApplication;
    private com.ninespartans.xmanager.common.MainApplication mainApplication;
    @org.jetbrains.annotations.NotNull()
    public static final com.ninespartans.xmanager.AppVersionActivity.Companion Companion = null;
    private static java.io.File file;
    private static android.net.Uri destinationUri;
    @org.jetbrains.annotations.NotNull()
    private final kotlin.Lazy okClient$delegate = null;
    @org.jetbrains.annotations.NotNull()
    private final java.lang.String url = "https://gitlab.com/api/v4/projects/20772874/repository/files/xmanager.json/raw?ref=master&private_token=1S_FpPnkbC5eyeWUmrYR";
    private final kotlin.Lazy okRequestList$delegate = null;
    private final android.content.BroadcastReceiver onCompleteDownload = null;
    
    public AppVersionActivity() {
        super();
    }
    
    @org.jetbrains.annotations.NotNull()
    public final okhttp3.OkHttpClient getOkClient() {
        return null;
    }
    
    @org.jetbrains.annotations.NotNull()
    public final java.lang.String getUrl() {
        return null;
    }
    
    public final okhttp3.Request getOkRequestList() {
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
    protected void onDestroy() {
    }
    
    @kotlin.Metadata(mv = {1, 5, 1}, k = 1, d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\b\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002\u00a2\u0006\u0002\u0010\u0002R\u000e\u0010\u0003\u001a\u00020\u0004X\u0082.\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0006X\u0082.\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0007"}, d2 = {"Lcom/ninespartans/xmanager/AppVersionActivity$Companion;", "", "()V", "destinationUri", "Landroid/net/Uri;", "file", "Ljava/io/File;", "app_debug"})
    public static final class Companion {
        
        private Companion() {
            super();
        }
    }
}