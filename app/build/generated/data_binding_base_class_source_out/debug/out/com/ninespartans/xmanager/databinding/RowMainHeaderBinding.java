// Generated by view binder compiler. Do not edit!
package com.ninespartans.xmanager.databinding;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.viewbinding.ViewBinding;
import androidx.viewbinding.ViewBindings;
import com.google.android.material.card.MaterialCardView;
import com.google.android.material.chip.Chip;
import com.google.android.material.chip.ChipGroup;
import com.google.android.material.progressindicator.LinearProgressIndicator;
import com.ninespartans.xmanager.R;
import java.lang.NullPointerException;
import java.lang.Override;
import java.lang.String;

public final class RowMainHeaderBinding implements ViewBinding {
  @NonNull
  private final MaterialCardView rootView;

  @NonNull
  public final Chip chipCreateAccount;

  @NonNull
  public final ChipGroup chipGroup;

  @NonNull
  public final TextView countDownTimerLabel;

  @NonNull
  public final LinearLayout currentProgramSection;

  @NonNull
  public final TextView dashboardDetailTitle;

  @NonNull
  public final TextView dashboardSubTitle;

  @NonNull
  public final TextView dashboardTitle;

  @NonNull
  public final TextView program;

  @NonNull
  public final LinearProgressIndicator programProgressBar;

  @NonNull
  public final TextView programTitle;

  @NonNull
  public final ImageView userImageView;

  @NonNull
  public final LinearLayout userSection;

  private RowMainHeaderBinding(@NonNull MaterialCardView rootView, @NonNull Chip chipCreateAccount,
      @NonNull ChipGroup chipGroup, @NonNull TextView countDownTimerLabel,
      @NonNull LinearLayout currentProgramSection, @NonNull TextView dashboardDetailTitle,
      @NonNull TextView dashboardSubTitle, @NonNull TextView dashboardTitle,
      @NonNull TextView program, @NonNull LinearProgressIndicator programProgressBar,
      @NonNull TextView programTitle, @NonNull ImageView userImageView,
      @NonNull LinearLayout userSection) {
    this.rootView = rootView;
    this.chipCreateAccount = chipCreateAccount;
    this.chipGroup = chipGroup;
    this.countDownTimerLabel = countDownTimerLabel;
    this.currentProgramSection = currentProgramSection;
    this.dashboardDetailTitle = dashboardDetailTitle;
    this.dashboardSubTitle = dashboardSubTitle;
    this.dashboardTitle = dashboardTitle;
    this.program = program;
    this.programProgressBar = programProgressBar;
    this.programTitle = programTitle;
    this.userImageView = userImageView;
    this.userSection = userSection;
  }

  @Override
  @NonNull
  public MaterialCardView getRoot() {
    return rootView;
  }

  @NonNull
  public static RowMainHeaderBinding inflate(@NonNull LayoutInflater inflater) {
    return inflate(inflater, null, false);
  }

  @NonNull
  public static RowMainHeaderBinding inflate(@NonNull LayoutInflater inflater,
      @Nullable ViewGroup parent, boolean attachToParent) {
    View root = inflater.inflate(R.layout.row_main_header, parent, false);
    if (attachToParent) {
      parent.addView(root);
    }
    return bind(root);
  }

  @NonNull
  public static RowMainHeaderBinding bind(@NonNull View rootView) {
    // The body of this method is generated in a way you would not otherwise write.
    // This is done to optimize the compiled bytecode for size and performance.
    int id;
    missingId: {
      id = R.id.chipCreateAccount;
      Chip chipCreateAccount = ViewBindings.findChildViewById(rootView, id);
      if (chipCreateAccount == null) {
        break missingId;
      }

      id = R.id.chipGroup;
      ChipGroup chipGroup = ViewBindings.findChildViewById(rootView, id);
      if (chipGroup == null) {
        break missingId;
      }

      id = R.id.countDownTimerLabel;
      TextView countDownTimerLabel = ViewBindings.findChildViewById(rootView, id);
      if (countDownTimerLabel == null) {
        break missingId;
      }

      id = R.id.current_program_section;
      LinearLayout currentProgramSection = ViewBindings.findChildViewById(rootView, id);
      if (currentProgramSection == null) {
        break missingId;
      }

      id = R.id.dashboardDetailTitle;
      TextView dashboardDetailTitle = ViewBindings.findChildViewById(rootView, id);
      if (dashboardDetailTitle == null) {
        break missingId;
      }

      id = R.id.dashboardSubTitle;
      TextView dashboardSubTitle = ViewBindings.findChildViewById(rootView, id);
      if (dashboardSubTitle == null) {
        break missingId;
      }

      id = R.id.dashboardTitle;
      TextView dashboardTitle = ViewBindings.findChildViewById(rootView, id);
      if (dashboardTitle == null) {
        break missingId;
      }

      id = R.id.program;
      TextView program = ViewBindings.findChildViewById(rootView, id);
      if (program == null) {
        break missingId;
      }

      id = R.id.programProgressBar;
      LinearProgressIndicator programProgressBar = ViewBindings.findChildViewById(rootView, id);
      if (programProgressBar == null) {
        break missingId;
      }

      id = R.id.programTitle;
      TextView programTitle = ViewBindings.findChildViewById(rootView, id);
      if (programTitle == null) {
        break missingId;
      }

      id = R.id.userImageView;
      ImageView userImageView = ViewBindings.findChildViewById(rootView, id);
      if (userImageView == null) {
        break missingId;
      }

      id = R.id.userSection;
      LinearLayout userSection = ViewBindings.findChildViewById(rootView, id);
      if (userSection == null) {
        break missingId;
      }

      return new RowMainHeaderBinding((MaterialCardView) rootView, chipCreateAccount, chipGroup,
          countDownTimerLabel, currentProgramSection, dashboardDetailTitle, dashboardSubTitle,
          dashboardTitle, program, programProgressBar, programTitle, userImageView, userSection);
    }
    String missingId = rootView.getResources().getResourceName(id);
    throw new NullPointerException("Missing required view with ID: ".concat(missingId));
  }
}